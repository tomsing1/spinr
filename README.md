# spinr

This repository contain the `spinr` R package that explores different ways
to balance a microcentrifuge. It is intended for educational purposes.

It was inspired by 
[Martin Johnsson's blog post](https://onunicornsandgenes.blog/2016/06/11/balancing-a-centrifuge/)
and 
[Peil and Hauryliuk's arXiv preprint](https://arxiv.org/ftp/arxiv/papers/1004/1004.3671.pdf)
referenced in Martin's post. Martin shared 
[his original code in this gist](https://github.com/mrtnj/rstuff/blob/master/centrifuge.R).

## Shiny app

To start the incuded shiny app, first install the `spinr` package, e.g. with
the `install_github` function from the
[devtools](https://www.rstudio.com/products/rpackages/devtools/)
R package:

```r
library("devtools")
install_github("tomsing1/spinr")
```

A call to the `spinrApp` function starts the shiny app:
```r
library(spinr)
spinrApp()
```
