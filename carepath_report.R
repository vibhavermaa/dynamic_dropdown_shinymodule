source("module2.R")

gen_process_report <- function(id){
  dropdownlev2Server(id)
  
  # call_module2server <- function(id){
  #   dropdownlev2Server(id)
  # }

  # return(list(
  #   "call_module2server" <- call_module2server
  # ))
}


gen_process_settings <- function(ns, id){
  dropdownlev2UI(ns(id))
}