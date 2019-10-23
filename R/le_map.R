library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(highcharter)
library(DT)

le_map <- function(life_expectancy) {
  map <- hcmap('custom/world', data = life_expectancy, 
               name = "Life Expectancy", value = "diff", borderColor = "black", 
               joinBy = c("name", "Country"), download_map_data = FALSE) %>%
    hc_colorAxis(dataClasses = color_classes(c(-10, 2, 2.2, 4, 6, 8, 20), 
                                             colors = c("#aa0000","#ff0000", "#7F0000", "#7F5200","#1D6618","#00ff00")))
  return(map)
}