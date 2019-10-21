
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Envelope

<!-- badges: start -->

<!-- badges: end -->

The goal of Envelope is to help you easily, reasonably, and fairly
calculate how much should each child in each family receive in their
envelope during Chinese New Year.

## Installation

You can install the released version of Envelope from
[CRAN](https://CRAN.R-project.org) with: devtools::install\_github()

``` r
install.packages("Envelope")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("QMSS-G5072-2019/Lai_Ting_An")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Envelope)
envelope (2, 4)
#> [1] "In x family, each child receive $1200"
#> [1] "In y family, each child receive $600"
#> [1] 1200  600
```
