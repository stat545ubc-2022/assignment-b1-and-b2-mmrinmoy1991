
# rPackageMC1

<!-- badges: start -->
<!-- badges: end -->

The goal of rPackageMC1 is to explore the variables in a data frame and identify the variables which are potentially logical (number of factor levels = 2) in nature.

## Installation

You can install the development version of rPackageMC1 like so:


``` r
install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-mmrinmoy1991/rPackageMC1")
```

## Data
This package currently contains few sample data for use of an example.
 - `apt_buildings`: Data taken from UBC-MDS/datateachr package
 - `vancouver_trees`: Data taken from UBC-MDS/datateachr package
 - `numbers`: A vector of numerical data used for testing the package
 - `strings`: A vector of character data used for testing the package
 - `emp.data`: A data frame for employee data (employee id, name, salary and start date) used for testing the package
 
## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rPackageMC1)
## basic example code

poten_logi_param(apt_buildings)

## You can change logical_factors as per desired levels
poten_logi_param(apt_buildings, logical_factors = 4)

```

