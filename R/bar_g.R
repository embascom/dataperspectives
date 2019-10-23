library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(highcharter)
library(DT)

bar_gr <- function(developed_count) {
  bar <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "Change in Life Expectancy in the World's Most Developed Countries") %>% 
    hc_xAxis(categories = developed_count$Country) %>% 
    hc_add_series(data = developed_count$difference, name = "Life Expectancy Increase (Years)", color = "gray")
  return(bar)
}