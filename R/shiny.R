#' Start the spinr shiny application
#' 
#' @param appDir Scalar character, the path to the `spinr` shiny app
#' @param ... Additional arguments passed on to the [shiny::runApp()] function
#' @return Nothing, the shiny app will be started in a separate window
#' @importFrom shiny runApp
#' @export
#' @examples
#' \dontrun{
#' spinrApp()
#' }
spinrApp <- function(appDir = system.file("shiny", package = "spinr"),
                     ...) {
  shiny::runApp(appDir = appDir, ...)
}