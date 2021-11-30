library(shiny)

default_type 				    = "frequency"
default_frequency 		= "absolute"
default_performance		= "median"

dropdownlev2UI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(12,
             selectInput(ns("type"), "Type:",
                         list("frequency", "performance"),
                         selected = default_type
             ))
    ),
    fluidRow(
      column(12,
             selectInput(ns("frequency"), "Frequency:",
                         list("absolute", "relative"),
                         selected = default_frequency
             ))
    ),
    fluidRow(
      column(12,
             selectInput(ns("performance"), "Performance:",
                         list("mean", "median"),
                         selected = default_performance
             ))
    )
    ,
    verbatimTextOutput(ns("type_type"))
  )
}

dropdownlev2Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns

      observeEvent(input$type,{
        
        if(input$type == "frequency"){
          updateSelectizeInput(session, "frequency", label = "Frequency", choices = list("absolute", "relative") ,selected = default_frequency)
          updateSelectizeInput(session, "performance", label = "Performance", choices  = NA, selected = NA, options  = list(placeholder = "NA"))
        }
        else{
          updateSelectizeInput(session, "frequency", label = "Frequency", choices = NA, selected = NA,options  = list(placeholder = "NA"))
          updateSelectizeInput(session, "performance", label = "Performance", choices  = list("mean","median"), selected = default_performance)
        }
      })

      output$type_type <- renderText({
        paste("type selected : ", input$type)
      })
      
      return(
        list(
          type = reactive({ input$type })
        )
      )
    }
  )
}
