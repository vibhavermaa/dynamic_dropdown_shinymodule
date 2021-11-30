library(shiny)


dropdownUI <- function(id) {
  ns <- NS(id)
  
  #directly call module2
  # dropdownlev2UI(ns("module2"))
  
  
  tagList(
    fluidRow(
      column(
        12,
        uiOutput(ns("module2"))
      )
    )
  )
}

dropdownServer <- function(id, gen_settings) {
  moduleServer(
    id,
    function(input, output, session) {
      
      ns <- session$ns
    
      output$module2 <- renderUI({gen_settings(ns=ns, "Primary")})
      
      gen_process_report("Primary")
      
      
      
      #directly call module2
      # dropdownlev2Server("module2")

    }
  )
}



















##case1: UI generation and ObserveEvent at app level
#Working.

##case2: UI generation and ObserveEvent at module level
#Working.

##case3: ObserveEvent at module level and UI generation at  module level2
#Working.


##case4: ObserveEvent at module level and UI generation at helper script
#observeEvent at module level not working.


##case5: ObserveEvent at module level1 and UI generation at  module level2
#not working, module adds ns with the ids, which can not be used a level up from that module

## case5 : like process animator

