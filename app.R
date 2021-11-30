# DEBUG  ----
# options(shiny.reactlog=TRUE) # Generate visual trace of reactive events, sources and sinks:  uncomment this line, launch your Shiny app. In the Shiny app, press Ctrl+F3 to launch the reactive log visualization
# options(shiny.trace = TRUE)  # Dumps websocket output between client and server (shiny) to the console


library(shiny)

source("carepath_report.R")
source("module1.R")


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  #module UI
  dropdownUI("module_ui")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  dropdownServer("module_ui",gen_settings = gen_process_settings)
  
}

# Run the application 
shinyApp(ui = ui, server = server)
