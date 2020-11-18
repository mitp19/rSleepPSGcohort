#' Process XML annonated data files
#'
#' A function that takes the output from ProcessData and visualizes total sleep time in minutes by participant
#'
#' @param summaryMetrics dataframe output
#' @return Returns a ggplot bar graph of timeasleep
#'
#' @examples
#' metricsDf <- ProcessData("data")
#' print(VisualizeSummaryMetrics(metricsDf))
#'
#' @export
#' @import ggplot2

VisualizeSummaryMetrics <- function(summaryMetrics) {
  metricsPlot <- ggplot2::ggplot(summaryMetrics, ggplot2::aes(x=filename, y=time_asleep)) +
                                   ggplot2::geom_bar(stat="identity", fill="steelblue")
  return(metricsPlot)
}