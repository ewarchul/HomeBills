#' Simple mean prediction
#'
#' @description
#' Function computes prediction for column specified by variable
#' `var` as a mean of last `h` values. 
#' @param dfx data frame :: Tibble
#' @param var variable name in data set :: String
#' @param h horizon :: Int
#' @return named list :: [Int]
#' Tibble -> String -> Int -> [Int]

mean_model_preds = function(dfx, var, h = 4) {
  df_var = 
    dfx %>% dplyr::select(!!rlang::sym(var))
  prediction = 
    df_var %>%
      dplyr::slice(h:n()) %>%
      dplyr::pull() %>%
      mean()
  time = 
    dfx %>% 
      dplyr::select(Date) %>%
      dplyr::pull() %>%
      dplyr::last()
  list(
       name = var,
       value = prediction,
       when = time + base::months(1)
  )
}
