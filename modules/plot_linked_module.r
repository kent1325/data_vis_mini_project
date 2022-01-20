plot_linked_UI <- function(id) {
    ns = NS(id)
    list(
        fluidRow(
            plotlyOutput(ns("scatter_score_plot")),
            plotlyOutput(ns("preparation_course_plot"))
        )
    )

}

plot_linked <- function(input, output, session, df) {
    ns <- session$ns

    output$scatter_score_plot <- renderPlotly({
        df_vis <- df()
        df_vis$rowID <- 1:nrow(df_vis)

        plot <- plot_ly() %>%
            config(scrollZoom = TRUE, displaylogo = FALSE, modeBarButtonsToRemove = c("hoverCompareCartesian", "toggleSpikelines","toImage", "sendDataToCloud", "editInChartStudio", "lasso2d", "drawclosedpath", "drawopenpath", "drawline", "drawcircle", "eraseshape", "autoScale2d", "hoverClosestCartesian","toggleHover")) %>%
            layout(dragmode = "pan", legend=list(title=list(text='gender'))) %>%
            add_trace(data=df_vis, x =~reading.score, y =~writing.score, color = ~gender, colors=c("#F8766D", "#00BFC4"), key=~rowID,
                      type='scatter',mode='markers') %>%
            layout(dragmode = "select", clickmode = 'event+select' ) %>%
            event_register("plotly_selecting")
        
        return(plot)
    })
    
    output$preparation_course_plot <- renderPlotly({
        df_vis <- df()
        df_vis$rowID <- 1:nrow(df_vis)
        
        select.data <- event_data(event = "plotly_selecting")
        if (!is.null(select.data)) {
            df_vis = df_vis %>% filter(rowID %in% select.data$key)
        }
        
        prep_df <- df_vis %>% group_by(test.preparation.course, gender) %>% summarise(n = n())
        
        plot <- plot_ly() %>%
            config(scrollZoom = TRUE, displaylogo = FALSE, modeBarButtonsToRemove = c("select2d","hoverCompareCartesian", "toggleSpikelines","zoom2d","toImage", "sendDataToCloud", "editInChartStudio", "lasso2d", "drawclosedpath", "drawopenpath", "drawline", "drawcircle", "eraseshape", "autoScale2d", "hoverClosestCartesian","toggleHover")) %>%
            layout(dragmode = "pan", showlegend=FALSE, yaxis = list(title = 'Count'), barmode = 'stack') %>%
            add_trace(data=prep_df, x=~test.preparation.course, y=~n, type='bar',hoverinfo='none', color=~gender, colors=c("#F8766D", "#00BFC4"))
        
        # In case no markers were inside the selection, we cannot plot data. So check
        # if there are any rows.
        #if (nrow(prep_df) > 0) {
        #    # Now we can create a plot of the data.
        #    plot <- plot %>%
        #        add_trace(data=prep_df, x=~test.preparation.course, y=~n, type='bar',hoverinfo='none', color=~gender)
        #}
        
        return(plot)
    })
}