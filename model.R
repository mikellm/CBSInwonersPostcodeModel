library(tidyverse)
library(tidymodels)

create_population_model <- function(data = readRDS("data/pc4_data.Rds")){

  data_subset <- data %>% select(postcode, jaar, aantalInwoners, aantalGeboorten, aantalWoningen) %>%
    mutate(vorig_jaar = jaar-1, voorspel_jaar = jaar+2)

  ml_data <- data_subset %>%
    left_join(data_subset %>% select(-voorspel_jaar, -vorig_jaar), by = c("vorig_jaar"="jaar", "postcode"="postcode"), suffix = c(".dit_jaar", ".vorig_jaar")) %>%
    left_join(data_subset %>% select(jaar, postcode, aantalInwoners), by = c("voorspel_jaar" = "jaar", "postcode" = "postcode"), suffix = c("", ".voorspel_jaar")) %>%
    drop_na() %>%
    select(-vorig_jaar, -voorspel_jaar)

  # check of we niet te veel rijen zijn kwijt geraakt met de drop_na()
  data_subset %>% filter(jaar >= 2016 & jaar <= 2021) %>% nrow()

  train_data <- ml_data %>% filter(jaar < 2020)
  test_data  <- ml_data %>% filter(jaar >= 2020)

  # ---- tune
  kfold_data <- vfold_cv(train_data)

  data_recipe <- recipe(aantalInwoners ~ ., data = train_data) %>%
    update_role(postcode, jaar, new_role = "ID") %>%
    step_zv()

  model <- parsnip::rand_forest(mode = "regression", mtry = tune(), trees = 1000, min_n = tune()) %>%
    set_engine("ranger", num.threads = 12)

  workflow <- workflow() %>% add_model(model) %>% add_recipe(data_recipe)

  tune_result <- workflow %>% tune_grid(kfold_data,
                                          grid = 16,
                                          control = control_grid(save_pred = TRUE),
                                          metrics = metric_set(rmse, mae))

  tune_result %>% show_best(metric = "mae")
  autoplot(tune_result)

  best_params <- tune_result %>% select_best(metric = "mae")

  # ---- predict

  model <- parsnip::rand_forest(mode = "regression", mtry = best_params$mtry, trees = 1000, min_n = best_params$min_n) %>%
    set_engine("ranger", importance = "impurity")

  workflow <- workflow %>% update_model(model)

  ml_fit <- workflow %>% fit(data = train_data)

  ml_fit %>% extract_fit_parsnip() %>%
    vip::vip(num_features = 20)

  preds <- bind_cols(test_data %>% select(postcode, jaar, aantalInwoners),
                     predict(ml_fit, test_data))

  mae(preds, truth = aantalInwoners, estimate = .pred)

  all_preds <- bind_cols(ml_data,
                         predict(ml_fit, ml_data))
  mae(all_preds, truth = aantalInwoners, estimate = .pred)

  saveRDS(ml_fit, "data/model.Rds")
  saveRDS(all_preds, "data/predictions.Rds")
}
