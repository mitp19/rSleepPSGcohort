library(rSleepPSGcohort)
library(shiny)
library(shinyFiles)
library(ggplot2)


# file directory selection code based on user mRcSchwering https://stackoverflow.com/questions/39196743/interactive-directory-input-in-shiny-app-r 
ui <- fluidPage(
  titlePanel("Select file with Sleep PSG data"),
  sidebarPanel(
    shinyDirButton("dir", "Chose directory", "Upload")
  ),
  
  mainPanel(
    h4("output$dir"),
    br(),
    h4("Files in that dir"),
    verbatimTextOutput("files")
  ),
  
  plotOutput(
    "plotOut",
    width = "100%",
    height = "400px",
    click = NULL,
    dblclick = NULL,
    hover = NULL,
    brush = NULL,
    inline = FALSE
  )
  
)

server <- function(input, output) {
  # dir
  shinyDirChoose(input, 'dir', roots = c(home = '~'), filetypes = c('', 'txt'))
  dir <- reactive(input$dir)
  output$dir <- renderPrint(dir())
  

  # path
  path <- reactive({
    home <- normalizePath("~")
    file.path(home, paste(unlist(dir()), collapse = .Platform$file.sep))
  })
  
  processData <- reactive({
    home <- normalizePath("~")
    dirSelected <- file.path(home, paste(unlist(dir()$path[-1]), collapse = .Platform$file.sep))
    df <- rSleepPSGcohort::ProcessData(dirSelected)
    rSleepPSGcohort::VisualizeSummaryMetrics(df)
  })
  
  # files
  output$files <- renderPrint(list.files(path()))
  output$plotOut <- renderPlot(processData())
}
shiny::shinyApp(ui = ui, server = server)
# [END]
