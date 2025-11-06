# Install and load required packages
install.packages("ggplot2")
library(readr)
library(ggplot2)

# Loads the dataset into the variable named coffee
coffee <- read_csv("final/coffee_sales.csv")

# Reorder the appearances of Weekdays
coffee$Weekday <- factor(coffee$Weekday, levels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"), ordered = TRUE)
coffee$Month_name <- factor(coffee$Month_name, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)

# Adds a new column into the dataset called 'Season' and is determined based on the solstice dates

# View the dataset
View(coffee)

# Bar chart
# Sales by weekday and time of day
ggplot(data = coffee, aes(x = Weekday, fill = Time_of_Day)) +
  geom_bar(position = "dodge", color = "black") +
  scale_fill_manual(values = c("Afternoon" = "#D6B588", "Morning" = "#705E46", "Night" = "#422701")) +
  labs(title = "Bar Distribution of Coffee Sales by Weekday and Time of Day", x = "Weekday", y = "Count", fill = "Time of Day")

# Sales by month and time of day
ggplot(data = coffee, aes(x = Month_name, fill = Time_of_Day)) +
  geom_bar(position = "dodge", color = "black") +
  scale_fill_manual(values = c("Afternoon" = "#D6B588", "Morning" = "#705E46", "Night" = "#422701")) +
  labs(title = "Bar Distribution of Coffee Sales by Month and Time of Day")

# Sales by month and season
ggplot(data = coffee, aes(x = Month_name, fill = )) +
  geom_bar(position = "dodge", color = "black") +
  scale_fill_manual(values = c("Afternoon" = "#D6B588", "Morning" = "#705E46", "Night" = "#422701")) +
  labs(title = "Bar Distribution of Coffee Sales by Month and Season")

# Box plot
ggplot(data = coffee, aes(x = Weekday, y = Time_of_Day)) +
  geom_boxplot(width = 0.3) +
  theme_minimal()

# Scatter plot
ggplot(data = coffee, aes(x = Weekday, y = Time_of_Day)) +
  geom_dotplot()
