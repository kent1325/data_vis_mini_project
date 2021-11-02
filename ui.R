# Here we define the design and layout of our R Shiny application (Bootstrap).
shinyUI(
  fluidPage(
  # Here we let a submodule do the graph plot for us. (ggplot)
  basic_ggplot_UI("basic_fast_plot")
  )
)