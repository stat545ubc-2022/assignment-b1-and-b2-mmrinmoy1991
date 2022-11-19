# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'



## Here is the function:
poten_logi_param <- function(dataset, logical_factors = 2){

  #load required library
  suppressPackageStartupMessages(library(tidyverse))

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

