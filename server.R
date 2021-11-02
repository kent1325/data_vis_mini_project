shinyServer(function(input, output, session) {
  path_to_file <- "C:\\Users\\Kent Vugs\\Documents\\DV_AAU\\3. Semester\\Data Visualization\\mini_project\\data\\StudentsPerformance.csv"
  df <- read.csv(path_to_file, header=TRUE, sep = ",", na.string="NULL")
  

  output$students_performance <- renderPlotly({
    df_vis <- df
    plot <- df_vis %>% 
      plot_ly(x = ~race.ethnicity, y = ~math.score)
    
    return(plot)
  })

})
