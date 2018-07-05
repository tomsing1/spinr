library(shiny)
library(shinyjs)
library(spinr)

alignCheckBoxGroup <- function() {
  tags$head(
    tags$style(
      HTML(
        ".checkbox-inline { 
             margin-left: 0px;
             margin-right: 10px;
        }
        .checkbox-inline+.checkbox-inline {
             margin-left: 0px;
             margin-right: 10px;
        }"
      )
    ) 
  )
}

image_success <- dir("images", pattern = "^success")
image_fails <- dir("images", pattern = "^fail")