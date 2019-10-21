child_mortality <- read.csv("data/child_mortality.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
child_mortality <- na.omit(child_mortality)
View(child_mortality)
life_expectancy <- read.csv("data/life_expectancy.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
life_expectancy <- na.omit(life_expectancy)
View(life_expectancy)

child_mortality <- read.csv("data/child_mortality.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
child_mortality <- na.omit(child_mortality)
child_mortality <- mutate(child_mortality, difference_2000_2015 = X2000 - X2015)

View(child_mortality)

