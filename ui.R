# Here we define the design and layout of our R Shiny application (Bootstrap).
shinyUI(
  fluidPage(
  # Define a navigation panel.
  # This is the navigation bar in our application. Within each tabPanel
  # assign a label to the menu item and then we call our submodules.
  navlistPanel(id = "pageChooser", well= FALSE, widths=c(2,10),
    tabPanel("Data Investigator", basic_ggplot_UI("basic_fast_plot")),
    #tabPanel("Linked Plots", page_linked_plots_UI("linked_plots_example"))
    ),
  )
)
