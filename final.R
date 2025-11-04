# Install and load required packages
install.packages("ggplot2")
library(readr)
library(ggplot2)

# Loads the dataset into the variable named coffee
coffee <- read_csv("final/coffee_sales.csv")

# Reorder the appearances of Weekdays
coffee$Weekday <- factor(coffee$Weekday, levels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"), ordered = TRUE)

# View the dataset
View(coffee)

# Bar chart
ggplot(data = coffee, aes(x = Weekday, fill = Time_of_Day)) +
  geom_bar(position = "dodge") +
  labs(title = "Bar Distribution of Coffee Sales by Weekday and Time of Day", x = "Weekday", y = "Count", fill = "Time of Day")

# Box plot
ggplot(data = coffee, aes(x = Weekday, y = Time_of_Day)) +
  geom_boxplot(width = 0.3) +
  theme_minimal()

# Scatter plot
ggplot(data = coffee, aes(x = Weekday, y = Time_of_Day)) +
  geom_dotplot()
