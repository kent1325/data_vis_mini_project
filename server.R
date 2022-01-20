shinyServer(function(input, output, session) {
  r <- reactiveValues(df = NULL)
  path_to_file <- "data\\StudentsPerformance.csv"

  r$df <- read.csv(path_to_file, header = TRUE, sep = ",", na.string = "NULL")

  # Calls a module with the function to call, the UI and the data as parameters.
  #callModule(basic_ggplot, "basic_fast_plot", reactive(r$df))
  callModule(page_correlation, "correlation_page", reactive(r$df))
  callModule(page_data_exploration, "data_exploration", reactive(r$df))
  callModule(page_linked_plots, "linked_plots", reactive(r$df))
})