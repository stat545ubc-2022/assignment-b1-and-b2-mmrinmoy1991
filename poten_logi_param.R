
#' Logical Variable Identificaiton
#'
#' @param dataset the data frame/tibble to be checked for logical variables
#' @param logical_factors Number of factors to be considered for logical variable. Default value is 2. 
#' This could be changed to any other numerical value (>2) when desired factor levels are to be passed.
#' When, logical_factors > 2 is passed, output will have cumulative column names for factors 2 
#' to the given value.
#'
#' @return character vector of column names from the dataset
#' @export
#'
#' @examples
#' poten_logi_param(parking_meters) # requires library `datateacher`
#' will give "credit_card"
#' 
#' 
poten_logi_param <- function(dataset, logical_factors = 2){
  
  # Check if dataset is a dataframe
  stopifnot("dataset must be of data.frame, tbl, tbl_df class" = is.data.frame(dataset))
  
  # check if logical_factors parameter is numeric and value >=2
  stopifnot("logical_factors must be a numeric and >=2" = 
              (is.numeric(logical_factors) && logical_factors>=2))
  
  # Generate vector of logical factors
  factor_number = seq(from=2, to = logical_factors, by = 1)
  
  # Extract column names
  dataset %>%
    mutate(across(where(is.character),as_factor))%>% 
    select_if(~ nlevels(.) %in% factor_number) %>% 
    names()
}