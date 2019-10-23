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
life_expectancy <- mutate(life_expectancy, diff = X2015 - X2000)
View(life_expectancy)

developed_count <- read.csv("data/developed_count.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
developed_count <- mutate(developed_count, difference = X2015 - X2000)
#View(developed_count)


my_server <- function(input, output) {
  
  output$cm_map <- renderHighchart({
    cm_map <- hcmap('custom/world', data = child_mortality, 
                          name = "Child Mortality", value = "difference_2000_2015", borderColor = "black", 
                          joinBy = c("name", "Country"), download_map_data = FALSE) %>%
      hc_colorAxis(dataClasses = color_classes(c(-10, 2, 10, 20, 40, 80, 200), 
                                             colors = c("#ff0000", "#00ff00")))
  })
  
  output$le_map <- renderHighchart({
    le_map <- hcmap('custom/world', data = life_expectancy, 
                    name = "Life Expectancy", value = "diff", borderColor = "black", 
                    joinBy = c("name", "Country"), download_map_data = FALSE) %>%
      hc_colorAxis(dataClasses = color_classes(c(-10, 2, 10, 50, 80, 200), 
                                               colors = c("#00ff00", "#ff0000")))
  })
  
  thm <- hc_theme(
    colors = c('red', 'green'),
    chart = list(
      backgroundColor = "#ffffff"
    ),
    title = list(
      style = list(
        color = '#333333'
      )
    ),
    subtitle = list(
      style = list(
        color = '#666666'
      )
    ),
    legend = list(
      itemStyle = list(
        color = 'black'
      ),
      itemHoverStyle = list(
        color = 'gray'
      )   
    )
  )
  
  output$bar_g <- renderHighchart({
    bar_g <- highchart() %>% 
      hc_chart(type = "column", options3d = list(enabled = TRUE, beta = 15, alpha = 15)) %>% 
      hc_title(text = "A highcharter chart") %>% 
      hc_xAxis(categories = c(developed_count$Country[1:11], developed_count$Country[13:15], developed_count$Country[12])) %>% 
      hc_add_series(data = c(developed_count$difference[1:11], developed_count$difference[13:15], developed_count$difference[12]), name = "Change in Life Expectancy", color = "green") #%>%
      #hc_xAxis(categories = developed_count$Country[12]) %>%
      #hc_add_series(data = developed_count$difference[12], name = "Change in Life Expectancy", color = "red")
  })
     # do map with Norway, Switzerland, Australia, Ireland, Germany, Iceland, Hong Kong, Sweden, Singpore, Netherlands
  #Denmark, Canada, USA, UK, Finland, New Zealand (top 15 developed countries) Bar graph
  
}