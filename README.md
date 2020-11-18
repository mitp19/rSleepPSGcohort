README.Rmd
================

## Description

This package makes it easier to do cohort analysis of participants that take part insleep polysomnography (PSG) studies. The package has the ability to take technician scored polysomnography data files of individual participants, create cohorts from these participants and compute summary metrics and visuals on a individual participant and cohort-level.

## Installation

The package can be installed with the following code snippet from Github:

``` r
require("devtools")
devtools::install_github("mitp19/rSleepPSGcohort", build_vignettes = TRUE)
library("rSleepPSGcohort")
```

## Overview

``` r
ls("package:rSleepPSGcohort")
data(package = "rSleepPSGcohort") # optional
```

`rSleepPSGcohort` contains 2 functions to help aggregate and visualize human-scored scored sleep data. *ProcessData* takes a directory of sleep PSG XML files and combines the key metrics into a dataframe. *VisualizeSummaryMetrics* takes the output from *ProcessData*, returning a visual of total sleep time, wake time and night time for each individual.

The package tree structure is provided below.

## Contributions

## References

R Core Team (2020). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. https://www.R-project.org/
  
  Wickham, H. and Bryan, J. (2019). *R Packages* (2nd edition). Newton, Massachusetts: O'Reilly Media. https://r-pkgs.org/

Zhang, G.-Q., Cui, L., Mueller, R., Tao, S., Kim, M., Rueschman, M., Mariani, S., Mobley, D., & Redline, S. (2018). The National Sleep Research Resource: Towards a sleep data commons. Journal of the American Medical Informatics Association: JAMIA, 25(10), 1351–1358. https://doi.org/10.1093/jamia/ocy064

## Acknowledgements
This package was developed for BCB410H: Applied Bioinformatics, University of Toronto, Toronto, Canada, 2020. `rSleepPSGcohort` welcomes issues, enhancement requests, and other contributions. To submit an issue, use the [GitHub issues](https://github.com/mitp19/rSleepPSGcohort/issues).
