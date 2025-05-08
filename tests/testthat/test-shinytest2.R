library(shinytest2)

test_that("{shinytest2} recording: postcode", {
  app <- AppDriver$new(variant = platform_variant(), name = "postcode", height = 1872, 
      width = 899)
  app$set_inputs(map_groups = "regions", allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7876", "0.142507928739305", "regions", 
      "52.8425945722395", "6.89846706759423"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7876", "0.701420310631372", "regions", "52.7695392206731", 
      "6.74474711946459"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7856", "0.952043699250277", "regions", 
      "52.7695392206731", "6.74474711946459"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7856", "0.922350606048679", "regions", "52.6963610782745", 
      "6.55808718245002"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7916", "0.991285071888098", "regions", 
      "52.6963610782745", "6.55808718245002"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7916", "0.293839258554648", "regions", "52.6697203836882", 
      "6.41534723061536"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7921", "0.444614622363244", "regions", 
      "52.6697203836882", "6.41534723061536"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7921", "0.842036596217266", "regions", "52.656393941988", 
      "6.3933872380254"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7924", "0.645220281295318", "regions", 
      "52.656393941988", "6.3933872380254"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7924", "0.273586416928813", "regions", "52.656393941988", 
      "6.38240724173042"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7921", "0.494498445514017", "regions", 
      "52.656393941988", "6.38240724173042"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7921", "0.872032988647567", "regions", "52.6430634366589", 
      "6.37142724543544"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7924", "0.673596507801421", "regions", 
      "52.6430634366589", "6.37142724543544"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7924", "0.209601792923542", "regions", "52.6430634366589", 
      "6.3055472676656"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7955", "0.290627935782139", "regions", 
      "52.6430634366589", "6.3055472676656"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_click = c("7955", "0.00143939236393553", "regions", "52.6430634366589", 
      "6.27260727878067"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_click = c(52.6430634366589, 6.27260727878067, 0.34672976424132), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7955", "0.956815561477795", "regions", "52.6430634366589", 
      "6.27260727878067"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7955", "0.149719251483586", "regions", 
      "52.6430634366589", "6.27260727878067"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7955", "0.310894330498063", "regions", "52.6830427622774", 
      "6.18476730842087"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("7951", "0.911336958669499", "regions", 
      "52.6830427622774", "6.18476730842087"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("7951", "0.130171481303677", "regions", "52.9022758616831", 
      "5.80046743809674"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("8515", "0.00251374055247022", "regions", 
      "52.9022758616831", "5.80046743809674"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("8515", "0.672741359941039", "regions", "53.2191908179894", 
      "5.36126758629775"), allow_no_input_binding_ = TRUE)
  app$set_inputs(year = 2022)
  app$set_inputs(map_shape_mouseover = c("1934", "0.15511495394766", "regions", "52.6230600582296", 
      "4.70246780859925"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("1934", "0.677904861990467", "regions", "52.5563160654066", 
      "4.76834778636912"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("1489", "0.541546345041272", "regions", 
      "52.5563160654066", "4.76834778636912"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("1489", "0.775579438380477", "regions", "52.5496360743823", 
      "4.77932778266407"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("1488", "0.972382987268521", "regions", 
      "52.5496360743823", "4.77932778266407"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_click = c("1488", "0.483595999741092", "regions", "52.5362730414595", 
      "4.79030777895905"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_click = c(52.5362730414595, 4.79030777895905, 0.88792626579657), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("1488", "0.0491399104236384", "regions", 
      "52.5362730414595", "4.79030777895905"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("1488", "0.298965062403319", "regions", 
      "52.5362730414595", "4.79030777895905"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("1488", "0.143417425026067", "regions", "52.5897007687178", 
      "4.74638779377917"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseover = c("1921", "0.798450784918779", "regions", 
      "52.5897007687178", "4.74638779377917"), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_shape_mouseout = c("1921", "0.227542856038892", "regions", "52.7362916559109", 
      "4.49384787899475"), allow_no_input_binding_ = TRUE)
  app$expect_values()
  app$expect_screenshot()
})
