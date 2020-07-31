source("prepare-data.R")
source("models.R")

#' @get /raw_data
#' @serializer unboxedJSON
function() {
  tidy_data() %>%
  list()
}


#' @get /raw_data/<ymd>
#' @serializer unboxedJSON
function(ymd) {
  data =
    tidy_data()
  if (is.null(ymd))
    list(data)
  else {
    data %>%
      dplyr::filter(Date == ymd) %>%
      list()
  }
}

#' @get /prediction/<var>/<h:int>
#' @serializer unboxedJSON
function(var, h) {
  data = 
    tidy_data()
  if (h > nrow(data) || h <= 0)
    h  = 4
  data %>%
    mean_model_preds(var, h)
}
