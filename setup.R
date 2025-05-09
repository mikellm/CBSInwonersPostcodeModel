install.packages(c("tidyverse", "tidymodels", "sf", "shiny","shinytest2", "shinyvalidate", "plotly", "leaflet", "htmltools", "waiter", "ranger"), dependencies =  TRUE)
# To run these tests you have to have Chrome installed
chromote::find_chrome()

# test de applicatie
shinytest2::test_app()

# check de werkmap
getwd()

# voeg map "data" toe en zet hier de bestanden in
# pc4_data.Rds
# prediction.Rds

rsconnect::writeManifest() # deze is door Kim toegevoegd in de verbeterde versie

# Option 1
# split the pc4_data into yearly data to lessen the memory load inside the app
readRDS("data/pc4_data.Rds") %>% dplyr::group_split(jaar) %>%
  walk2(2015:2023, ~saveRDS(.x, str_c("data/pc4_data_", .y, ".Rds")))

pc4_data %>% dplyr::group_split(jaar) %>%
  walk2(2015:2023, ~saveRDS(.x, str_c("data/pc4_data_", .y, ".Rds")))

# Option 2
# make the pc4_data smaller by removing useless columns
readRDS("data/pc4_data.Rds") %>% select(jaar, postcode, aantalInwoners) %>% saveRDS("data/pc4_data_small.Rds")
# only keep the geomtry data for one year, assuming that it stays the same over time
readRDS("data/pc4_data.Rds") %>% arrange(postcode, desc(jaar)) %>%
  select(postcode, geometry) %>% distinct(postcode, .keep_all = TRUE) %>% saveRDS("data/pc4_geometry.Rds")

## https://www.shinyapps.io/admin/#/dashboard

# STEP 1
# The rsconnect package can be installed directly from CRAN. To make sure you have the latest version run following code in your R console:
install.packages('rsconnect')

# STEP 2
# The rsconnect package must be authorized to your account using a token and secret. To do this, click the copy button below and we'll copy the whole command you need to your clipboard. Paste it into your R console to authorize your account. Once you've entered the command successfully in R, that computer is now authorized to deploy Shiny for R applications to your shinyapps.io account.
rsconnect::setAccountInfo(name='dit6t7-michael-damen', token='E58C65D2A37C836F8D405AAABD8E600A', secret='duW4cgnZ8NWdCfX2U844DeGV7SWHK0a5170TWKTE')

# STEP 3
# Once the rsconnect package has been configured, you're ready to deploy your first application. If you haven't written any applications yet, you can also checkout the Getting Started Guide for instructions on how to deploy our demo application. Run the following code in your R console.
library(rsconnect)
rsconnect::deployApp('C:/Users/Michael.LAN/OneDrive - Damen Technical Agencies BV/Projects/DSBA & AI - Dev & ML Ops/CBSInwonersPostcodeModel')
