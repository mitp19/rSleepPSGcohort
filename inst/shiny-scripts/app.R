library(shiny)

# This example is adapted from
# Grolemund, G. (2015). Learn Shiny - Video Tutorials. URL:https://shiny.rstudio.com/tutorial/

ui <- fluidPage(
  shinyDirButton('folder', 'Select a folder', 'Please select a folder', FALSE)
  
)

server <- function(input, output) {
  shinyDirChoose(input, 'folder', roots=c(wd='.'), filetypes=c('', 'txt'))
  
  observe({
    print(input$folder)
  })
}
shiny::shinyApp(ui = ui, server = server)
# [END]