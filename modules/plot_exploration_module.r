# This is the UI function of our module.
# It works similar to ui.R, except when creating outputs
# you have to remember to encapsulate them with ns()
# ns() concatenates the module ID to your outputs.
plot_exploration_UI <- function(id) {
    ns = NS(id)
    list(
        fluidRow(
            plotOutput(ns("exploration_plot")),
            plotOutput(ns("ethnicity_plot"))
        )
    )
}

# This is our server function of the module.
# Beyond storing the namespace, all computations must happen inside the
# plotlyOutput reactive context.
plot_exploration <- function(input, output, session, df) {
    ns <- session$ns
    output$exploration_plot <- renderPlot({
        # To read the reactive dataframe 'df', we need to "evaluate" it.
        # We do this by calling it as a function df().
        df_vis <- df()
        
        plot <- df_vis %>% group_by(gender)%>% summarise(n=n()) %>% ggplot(aes(gender,n,fill=gender))+
            geom_col()+ geom_text(aes(label=n),position =position_dodge(width = 1),vjust=0.25) +theme_base()
        

        return(plot)
    })
    
    output$ethnicity_plot <- renderPlot({
        # To read the reactive dataframe 'df', we need to "evaluate" it.
        # We do this by calling it as a function df().
        df_vis <- df()
        
        plot <- df_vis %>% group_by(race.ethnicity, gender) %>% summarise(n = n()) %>% 
            ggplot(aes(x = reorder(race.ethnicity, -n), y = n, fill = gender)) + 
            geom_col(position = 'dodge') + geom_label_repel(aes(label = n)) + 
            labs(x = "Race")  + theme_base()
        
        
        return(plot)
    })
}