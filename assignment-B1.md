assignment-B1
================
Mrinmoy Chakraborty
2022-11-04

## Setup and Data Installation

``` r
## Packages
suppressPackageStartupMessages(library(tidyverse))
```

    ## Warning: package 'readr' was built under R version 4.0.5

``` r
suppressPackageStartupMessages(library(testthat))
suppressPackageStartupMessages(library(dplyr))

## Data
suppressPackageStartupMessages(library(datateachr))
```

## Excerise 1 and 2 (Function and Documention)

In this exercise, I am going to create a function `poten_logi_param`
that create a character vector of column names of the given data frame
which can be identified as logical in nature. A logical variable usually
consists TRUE/FALSE or YES/NO or 1/0 as entries for individual columns.
However, in a loaded data frame, logical variables are often read as
character variables, which needs to be examined by individual columns
which could be cumbersome. In that case, this function could help
identify the column names which can potentially be logical (by assuming
two factor levels only). For a data frame with several columns, this
function, when applied, can provide quicker judgement in
checking/transferring character columns to logical columns.

``` r
#' Creates character vector of columns which are logical datatype
#'
#' @param dataset the data frame/tibble to be checked for logical variables
#' @param logical_factors Number of factors to be considered for logical variable. Default value is 2. 
#' This could be changed to any other numerical value (>2) when desired factor levels are to be passed.
#' When, logical_factors > 2 is passed, output will have cumulative column names for factors 2 to the given value.
#' @return character vector of column names from the dataset


## Here is the function:
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
```

## Excerise 3 (Examples)

### Case 1

Get the columns names (with character datatype) which are potentially
logical from *apt_buildings* data set

``` r
# apply function poten_logi_prarm()
poten_logi_param(apt_buildings)
```

    ##  [1] "balconies"                      "barrier_free_accessibilty_entr"
    ##  [3] "exterior_fire_escape"           "fire_alarm"                    
    ##  [5] "garbage_chutes"                 "intercom"                      
    ##  [7] "laundry_room"                   "locker_or_storage_room"        
    ##  [9] "pets_allowed"                   "separate_gas_meters"           
    ## [11] "separate_hydro_meters"          "separate_water_meters"         
    ## [13] "sprinkler_system"               "emergency_power"               
    ## [15] "non-smoking_building"           "cooling_room"

Here only single parameter `dataset = apt_buildings` is passed and the
second parameter takes the default value of 2. The output is a character
vector of columns which can have two factors, hence potentially logical
variable.

### Case 2

``` r
# apply function poten_logi_prarm()
poten_logi_param(apt_buildings, logical_factors = 4)
```

    ##  [1] "air_conditioning"               "balconies"                     
    ##  [3] "barrier_free_accessibilty_entr" "exterior_fire_escape"          
    ##  [5] "fire_alarm"                     "garbage_chutes"                
    ##  [7] "heating_type"                   "intercom"                      
    ##  [9] "laundry_room"                   "locker_or_storage_room"        
    ## [11] "pets_allowed"                   "property_type"                 
    ## [13] "separate_gas_meters"            "separate_hydro_meters"         
    ## [15] "separate_water_meters"          "sprinkler_system"              
    ## [17] "visitor_parking"                "window_type"                   
    ## [19] "emergency_power"                "non-smoking_building"          
    ## [21] "facilities_available"           "cooling_room"

Here, we passed `logical_factors = 4` in addition to
`dataset = apt_buildings`. The output provides the character vector of
column names which have `2 factor levels`, `3 factor levels` and
`4 factor levels`.

### Case 3

``` r
poten_logi_param(parking_meters)
```

    ## [1] "credit_card"

Similar to Case 1 but for a different data frame.

### Case 4

Error handling

``` r
poten_logi_param(parking_meters,1)
```

    ## Error in poten_logi_param(parking_meters, 1): logical_factors must be a numeric and >=2

Here `logical_factors = 1` has been provided, which throws an error.
`logical_factors` should be numeric and \>=2.

### Case 5

Error Handling

``` r
# A list of strings
strings = c("Mon", "Tue","Wed")

# A list of numbers
numbers = c(1,2,3,4,6)

# Create the data frame.
emp.data <- data.frame(
   emp_id = c (1:5), 
   emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
   salary = c(623.3,515.2,611.0,729.0,843.25), 
   
   start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
      "2015-03-27")),
   stringsAsFactors = FALSE
)

# passing a list of strings 
poten_logi_param(strings)
```

    ## Error in poten_logi_param(strings): dataset must be of data.frame, tbl, tbl_df class

``` r
# passing a list of numbers
poten_logi_param(numbers)
```

    ## Error in poten_logi_param(numbers): dataset must be of data.frame, tbl, tbl_df class

``` r
# passing a dataframe
poten_logi_param(emp.data)
```

    ## character(0)

Here, I show only `data.frame, tbl, tbl_df` class of data can be used in
the function

## Exercise 4 (Testing)

``` r
test_that("Datatype Testing",{
  expect_true(is_character(poten_logi_param(apt_buildings)))
  expect_equal(poten_logi_param(vancouver_trees), c("assigned","root_barrier","curb"))
  expect_error(poten_logi_param(strings),"dataset must be of data.frame, tbl, tbl_df class")
  expect_error(poten_logi_param(numbers),"dataset must be of data.frame, tbl, tbl_df class")
  expect_error(poten_logi_param(vancouver_trees,1),"logical_factors must be a numeric and >=2")
})
```

    ## Test passed 🎊
