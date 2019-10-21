library(shiny)
library(dplyr)
library(plotly)
library(highcharter)
library(DT)

child_mortality <- read.csv("data/child_mortality.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
child_mortality <- na.omit(child_mortality)
#View(child_mortality)
life_expectancy <- read.csv("data/life_expectancy.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
life_expectancy <- na.omit(life_expectancy)
#View(life_expectancy)

# Define the first page content
main_page <- tabPanel(
  "Main", # label for the tab in the navbar
  includeCSS("www/style_1.css"), 
  div(id = "container",
      div(id = "content",
          h2("Project Authors"),
          p("Wei Fan, Emily Bascom, Eric Kim", br(), br()),
          h2(""),
          p("", br(), br()),
          h2(""),
          p("", br(), br()),
          h2(""),
          p("", a("data set 1", href=""), a("data set 2", href=""),
            br(), br()),
          h2(""),
          p("", br(), br())
      )    
  )
)

# Define content for the first page
countries <- tabPanel(
  "Countries", # label for the tab in the navbar
  includeCSS("www/style_1.css"),
  div(id = "container",
      #titlePanel("Country Participation Information and Medals Won"),
      tags$script(src = "https://code.highcharts.com/mapdata/custom/world.js"), #Get World Map data
      #h3("Total Number of Medals Won by Country from 1896 to 2016"),
      highchartOutput("cm_map"),
      highchartOutput("le_map")
      #div(id = "content",
         # p("This map displays the total number of medals won by each country. From the graph, we know the United States has won the most medals (4357).
        #  The number of medal won is ranged from 0 to 4357. There is a huge difference between the number of medals won in different countries. 
        #  Some possible explanations for why this is is that some countries are participating in more sports than in other countries, some countries 
        #  begin participating in the Olympic game later than in other countries, and many countries may not have the resources to train for certain 
        #  events. Let's examine the relationship between the number of medals won and the number of sports the country participated in.")
      )
  )