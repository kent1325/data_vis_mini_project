# 1) IMPORT LIBRARIES
# When you import libraries below, they become available through-out your
# whole R Shiny application. Importing your libraries here also means
# you have a single location to watch what packages your application uses.
library(tidyverse)
library(plotly)
library(shiny)
library(shinyjs)
library(ggcorrplot)
library(ggthemes)
library(ggrepel)
library(ggpubr)

# 2) SET R OPTIONS
# Sometimes R defaults are not ideal for the app we use.
# shiny.fullstacktrace: prints full error messages from R Shiny for debugging.
# digits.secs: Show milliseconds in timestamps.
# shiny.maxRequestSize: increase maximum file upload size to 50MB.
options(shiny.fullstacktrace=TRUE)
options("digits.secs"=6)
options(shiny.maxRequestSize=50*1024^2)

# 3) IMPORT MODULES
# Whenever you create a new module, add it to the list below.
# Importing your module makes them callable in your R Shiny application.
#source("modules/basic_ggplot_module.R", local = T)
source("modules/plot_exploration_module.R", local = T)
source("modules/plot_linked_module.R", local = T)
source("modules/plot_correlation_module.R", local = T)

source("modules/page_data_exploration.R", local = T)
source("modules/page_correlation_module.R", local = T)
source("modules/page_linked_plots_module.R", local = T)