library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(highcharter)
library(DT)

child_mortality <- read.csv("data/child_mortality.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
child_mortality <- na.omit(child_mortality)
child_mortality <- mutate(child_mortality, difference_2000_2015 = X2000 - X2015)

#View(child_mortality)
life_expectancy <- read.csv("data/life_expectancy.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
life_expectancy <- na.omit(life_expectancy)
#View(life_expectancy)


my_server <- function(input, output) {
  
  output$cm_map <- renderHighchart({
    cm_map <- hcmap('custom/world', data = child_mortality, 
                          name = "Child Mortality", value = "difference_2000_2015", borderColor = "black", 
                          joinBy = c("name", "Country"), download_map_data = FALSE) %>%
      hc_colorAxis(dataClasses = color_classes(c(-10, 2, 20, 50, 80, 200), 
                                             colors = c("#ff0000", "#00ff00")))
  })
  
  output$le_map <- renderHighchart({
    le_map <- hcmap('custom/world', data = life_expectancy, 
                          name = "Life Expectancy", value = "X2007", borderColor = "black", 
                          joinBy = c("name", "Country"), download_map_data = FALSE) %>%
      hc_colorAxis(dataClasses = color_classes(c(-10, 2, 20, 50, 80, 200), 
                                               colors = c("#ff0000", "#00ff00")))
  })
  
  
  # do map with Norway, Switzerland, Australia, Ireland, Germany, Iceland, Hong Kong, Sweden, Singpore, Netherlands
  #Denmark, Canada, USA, UK, Finland, New Zealand (top 15 developed countries) Bar graph
  
}