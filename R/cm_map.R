library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(highcharter)
library(DT)

cm_map <- function(child_mortality) {
  map <- hcmap('custom/world', data = child_mortality, name = "Child Mortality", 
               value = "difference_2000_2015", borderColor = "black", 
               joinBy = c("name", "Country"), download_map_data = FALSE) %>%
    hc_colorAxis(dataClasses = color_classes(c(-10, 1.8, 2, 10, 20, 40, 80, 200), 
                                             colors = c("#aa0000","#ff0000", "#7F0000", "#7F5200","#1D6618","#00ff00")))
  return(map)
}

