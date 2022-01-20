# This is the UI function of our module.
# It works similar to ui.R, except when creating outputs
# you have to remember to encapsulate them with ns()
# ns() concatenates the module ID to your outputs.
page_data_exploration_UI <- function(id) {
    ns = NS(id)
    mainPanel(width = 12,
              fluidRow(
                  tags$h3("Data Exploration"),
                  tags$p("Investigate the distribution of the students' gender and ethnicity."),
                  
                  # This submodule provides another graph (Plotly).
                  plot_exploration_UI(ns("distribution_plot"))
              )
    )
}

page_data_exploration <- function(input, output, session, df, meta) {
    ns <- session$ns
    
    # Calling Plot Submodule Example:
    # Below is an example of how we can call submodules from our module.
    # Important: never add ns() around the ID when using callModule().
    # Only add ns() inside the module UI function.
    callModule(plot_exploration, "distribution_plot", df)
}