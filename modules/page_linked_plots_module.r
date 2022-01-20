# This is the UI function of our module.
# It works similar to ui.R, except when creating outputs
# you have to remember to encapsulate them with ns()
# ns() concatenates the module ID to your outputs.
page_linked_plots_UI <- function(id) {
    ns = NS(id)
    mainPanel(width = 12,
              fluidRow(
                  tags$h3("Linked Plots"),
                  tags$p("Use the box select to learn more about which students completed the preparation course."),
                  
                  # This submodule provides another graph (Plotly).
                  plot_linked_UI(ns("spatial_score_plot"))
              )
    )
}

page_linked_plots <- function(input, output, session, df, meta) {
    ns <- session$ns
    
    # Calling Plot Submodule Example:
    # Below is an example of how we can call submodules from our module.
    # Important: never add ns() around the ID when using callModule().
    # Only add ns() inside the module UI function.
    callModule(plot_linked, "spatial_score_plot", df)
}