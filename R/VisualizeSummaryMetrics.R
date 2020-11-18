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
#' @importFrom ggplot2 ggplot
#' 
#' 

VisualizeSummaryMetrics <- function(summaryMetrics) {
  metricsPlot <- ggplot2::ggplot(summaryMetrics, ggplot2::aes(x=filename, y=time_awake)) +
                                   ggplot2::geom_bar(stat="identity", fill="steelblue")
  return(metricsPlot)
}