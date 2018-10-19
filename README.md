
<!-- README.md is generated from README.Rmd. Please edit that file -->
Homework3Li
===========

The goal of this package is to create a new class for longitudinal datasets, and implement some functions and methods for data analysis.

Installation
------------

You can install the released version of Homework3Li from [github](https://github.com/stephlee3/Homework3Li) with:

``` r
require(devtools)
install_github("https://github.com/stephlee3/Homework3Li")
```

Example
-------

We will implement some functions and methods for longitudinal data anlaysis. The function can convert a data frame into a class, and we can get the number of different subjects in the dataset when we it.

``` r
require(Homework3Li)
#> Loading required package: Homework3Li
## Read in the data
library(readr)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
## Load any other packages that you may need to execute your code

file_path <- system.file("extdata","MIE.csv.gz",package="Homework3Li")
dat <- read_csv(file_path,col_types = "iicdi")
x <- make_LD(dat)
print(class(x))
#> [1] "LongitudinalData"
```

Then the function can filter subject-specific information, and we can get the subject ID or NULL(if the specific subject does not exist) when we it.

``` r
out <- subject(x, 10)
print(out)
#> NULL
out <- subject(x, 14)
print(out)
#> [1] "Subject ID: 14"
```

The function is to calculate the mean value over time at different visits and rooms for the specific subject.

``` r
out <- subject(x, 54) %>% summary
print(out)
#> ID: 54
#>   visit  bedroom       den living room    office
#> 1     0       NA        NA    2.792601 13.255475
#> 2     1       NA 13.450946          NA  4.533921
#> 3     2 4.193721  3.779225          NA        NA

out <- subject(x, 14) %>% summary
print(out)
#> ID: 14
#>   visit   bedroom family  room living room
#> 1     0  4.786592           NA     2.75000
#> 2     1  3.401442     8.426549          NA
#> 3     2 18.583635           NA    22.55069
```

Similarly, we can get functions and to extract specific info from the whole dataset. The can show the specific id, visit, or room, and can show the quantiles and mean value of different timepoints for a specific scenario.

``` r
out <- subject(x, 44) %>% visit(0) %>% room("bedroom")
print(out)
#> ID: 44 
#> Visit: 0 
#> Room: bedroom

out <- subject(x, 44) %>% visit(0) %>% room("bedroom") %>% summary
print(out)
#> ID: 44
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>     8.0    30.0    51.0    88.8    80.0   911.0

out <- subject(x, 44) %>% visit(1) %>% room("living room") %>% summary
print(out)
#> ID: 44
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    2.75   14.00   24.00   41.37   37.00 1607.00
```
