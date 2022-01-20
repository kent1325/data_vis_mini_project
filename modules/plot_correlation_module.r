plot_correlation_UI <- function(id) {
    ns = NS(id)
    list(
        fluidRow(
            plotOutput(ns("box_corr_plot")),
            plotOutput(ns("correlation_plot"))
        )
    )
}

plot_correlation <- function(input, output, session, df) {
    ns <- session$ns
    output$correlation_plot <- renderPlot({
        df_vis <- df()
        
        #1:Female, 2: Male
        df_vis$gender1 <- as.numeric(factor(df_vis$gender))
        # GroupA, GroupB, GroupC, GroupD =(1,2,3,4)
        df_vis$race.ethnicity1 <- as.numeric(factor(df_vis$race.ethnicity))
        # parental level of education
        df_vis$parent.education1 <- as.numeric(factor(df_vis$parental.level.of.education, levels=c('some high school','high school','some college',"associate's degree","bachelor's degree","master's degree")))
        #lunch
        df_vis$lunch1 <- as.numeric(factor(df_vis$lunch, levels=c("free/reduced",'standard')))
        #preparation course
        df_vis$praparationcourse <- as.numeric(factor(df_vis$test.preparation.course, levels =c('none','completed') ))
        
        dfNew <- select_if(df_vis, is.numeric)
        r <- cor(dfNew, use="complete.obs")
        round(r,2)
        
        plot <- ggcorrplot(r, hc.order=TRUE, type='lower', lab=TRUE, colors = c("#F8766D", "white", "#00BFC4"))

        return(plot)
    })
    
    output$box_corr_plot <- renderPlot({
        df_vis <- df()
        
        plot <- df_vis %>% ggplot(aes(race.ethnicity, reading.score, fill=gender))+
            geom_boxplot()+
            facet_wrap(~gender) + theme_base()
        
        
        return(plot)
    })
}