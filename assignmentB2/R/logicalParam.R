#' Logical Variables Identification
#'
#' Description: create a character vector of column names of the given
#' data frame which can be identified as logical in nature
#'
#' @param dataset the data frame/tibble to be checked for logical variables
#' @param logical_factors Number of factors to be considered for logical variable.
#' Default value is 2.
#'
#' @return character vector of column names from the dataset
#' @export
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
    mutate(across(where(is.character),as.factor))%>%
    select_if(~ nlevels(.) %in% factor_number) %>%
    names()
}
