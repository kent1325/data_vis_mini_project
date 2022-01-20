# This is the UI function of our module.
# It works similar to ui.R, except when creating outputs
# you have to remember to encapsulate them with ns()
# ns() concatenates the module ID to your outputs.
page_correlation_UI <- function(id) {
    ns = NS(id)
    mainPanel(width = 12,
              fluidRow(
                  tags$h3("Correlation in performance"),
                  tags$p("An investigation of which factors has the most impact on performance."),
                  # This submodule provides another graph (Plotly).
                  plot_correlation_UI(ns("performance_correlation"))
              )
    )
}

page_correlation <- function(input, output, session, df, meta) {
    ns <- session$ns
    
    # Calling Plot Submodule Example:
    # Below is an example of how we can call submodules from our module.
    # Important: never add ns() around the ID when using callModule().
    # Only add ns() inside the module UI function.
    callModule(plot_correlation, "performance_correlation", df)
}