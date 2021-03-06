#' Process XML annonated data files
#'
#' A function that takes a directory of xml files and outputs sleep summary metrics 
#'
#' @param directory file path to directory containing individual annonated sleep data files in standard profusion XML format
#' @return Returns a dataframe of sleep summary metrics per input file 
#'
#' @examples
#' fpath <- system.file("extdata", "raw_data", package = "rSleepPSGcohort")
#' sleepSummary <- ProcessData(fpath)
#' sleepSummary
#'
#' @export
#' @import XML
#' @import methods
#' 

ProcessData <- function(directory) {
    files <- list.files(directory)
    sleep_stage_codes <- c(1, 2, 3, 4, 5)
    summary_df <- data.frame(matrix(ncol = 4, nrow = 0))
    colnames(summary_df) <- c("filename", "minutes_observed", "time_awake", "time_asleep")
    for (f in files) {
      xml_file_path <- paste(directory, f, sep="/")
      xml_data_file <- XML::xmlParse(file = xml_file_path)
      sleep_stages <- XML::xmlToDataFrame(nodes = XML::xmlChildren(XML::xmlRoot(xml_data_file)[["SleepStages"]]))
      colnames(sleep_stages) <- c("stage") 
      sleep_stages$stage = as.numeric(sleep_stages$stage)
      sleep_stage_sums <- list()
      time_awake <- nrow(subset(sleep_stages, stage==0))/2
      time_sleep <- nrow(subset(sleep_stages, stage!=0))/2 # 30 second epochs, so dividing by 2 to get number of minutes
      summary_df <- rbind(summary_df, list("filename"=f, "minutes_observed"=nrow(sleep_stages), "time_awake"=time_awake, "time_asleep"=time_sleep))
    }
    return(summary_df)
    
}