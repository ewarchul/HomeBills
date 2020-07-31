#' Function composition operator
#' 
#' @description 
#' Infix operator which composes function from rhs to lhs i.e
#' f %.% g == f(g())

'%.%' = pryr::compose 


#' Rename loaded sheet
#'
#' @description
#' Function changes name of old data stored in xlxs file and
#' returns data frame with new colnames.
#' @param dfx data frame with date, prices and usage
#' @return data frame
#' Tibble -> Tibble

rename_sheet = function(dfx) {
  names(dfx) = 
    c(
      "Date",
      "CW_WC",
      "CW_Kitchen",
      "CW_Price",
      "HW_Bath",
      "HW_Kitchen",
      "HW_Price",
      "Gas",
      "Gas_Price",
      "Curr",
      "Curr_Price",
      "Trash_Price",
      "Sum_Price"
    )
  dfx
}

#' Repair data
#'
#' @description
#' Loaded data frame has some issues with date column and first row.
#' @param dfx data frame :: Tibble
#' @return data frame with removed first three rows
#' Tibble -> Tibble

repair_data = function(dfx) {
  dfx %>% 
    dplyr::slice(3:dplyr::n()) %>%
    dplyr::mutate(Date = seq(lubridate::ymd("2019-06-01"), lubridate::ymd("2020-06-01"), by = "months"))
}

#' Load data from file
#'
#' @description 
#' Function loads xlsx file with collected price and usage of house resources like water or gas
#' @param filepath path to file with data :: String
#' @return data frame 
#' String -> Tibble

load_data = function(filepath = "../data/bills-data.xlsx") {
  data = 
    readxl::read_excel(
      filepath, 
      col_types = c("text", rep("numeric", 12))
    )
}

#' Transform data to JSON
#' 
#' @description 
#' Function maps tibble data frame to JSON format.
#' @param dfx data frame :: Tibble
#' @return json formatted data :: [String]
#' Tibble -> [String]

make_json = function(dfx) {
  dfx %>%
    jsonlite::toJSON()
}

#' Clean and repair data
#' 
#' @description 
#' Composition of three functions which read, rename and repair collected data.
#' String -> Tibble

tidy_data = 
 repair_data %.% rename_sheet %.% load_data



