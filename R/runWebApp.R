#' Launch Shiny App for TestingPackage
#'
#' A function that launches the Shiny app for rSleepPSGcohort
#'
#' @return No return value but open up a Shiny page.
#'
#' @examples
#' \dontrun{
#'
#' rSleepPSGcohort::runWebApp()
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#'
#' @export
#' @import ggplot2
#' @import shinyFiles
#' @importFrom shiny runApp
runWebApp <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "rSleepPSGcohort")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
# [END]