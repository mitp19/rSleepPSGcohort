#' Process XML annonated data files
#'
#' A function that takes a directory of xml files and outputs sleep summary metrics 
#'
#' @param directory file path to directory containing individual annonated sleep data files in standard profusion XML format
#' @return Returns a dataframe of sleep summary metrics per input file 
#'
#' @examples
#' VisualizeSummaryMetrics <- ProcessData(summaryMetrics)
#'
#' @export VisualizeSummaryMetrics
#' @importFrom ggplot2
#' 
#' 

VisualizeSummaryMetrics <- function() {
  
  
}

summary <- ProcessData("data")
VisualizeSummaryMetrics(summary)