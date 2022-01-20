# Here we define the design and layout of our R Shiny application (Bootstrap).
shinyUI(
  fluidPage(
    includeCSS("custom.css"),
    useShinyjs(),
    
    navlistPanel(id = "pageChooser", well= FALSE, widths=c(2,10),
                 tabPanel("Correlation Plot", page_correlation_UI("correlation_page")),
                 tabPanel("Data Exploration", page_data_exploration_UI("data_exploration")),
                 tabPanel("Linked Plots", page_linked_plots_UI("linked_plots"))
    ),
  )
)
