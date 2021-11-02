# This is the UI function of our module.
# It works similar to ui.R, except when creating outputs
# you have to remember to encapsulate them with ns()
# ns() concatenates the module ID to your outputs.
basic_ggplot_UI <- function(id) {
    ns = NS(id)
    plotOutput(ns("basic_plot"))
}

# This is our server function of the module.
# Beyond storing the namespace, all computations must happen inside the
# plotlyOutput reactive context.
basic_ggplot <- function(input, output, session, df) {
    output$basic_plot <- renderPlot({
        # To read the reactive dataframe 'df', we need to "evaluate" it.
        # We do this by calling it as a function df().
        df_vis <- df()
        plot <- df_vis %>%
        ggplot(aes(x = writing.score, y = reading.score)) + geom_point()

        return(plot)
    })
}