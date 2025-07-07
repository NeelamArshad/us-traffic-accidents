#
#
#
#
#
#
#
#
#
#| message: false
library(readr)
library(dplyr)
library(ggplot2)

accidents <- read_csv("data/US_Accidents.csv", 150000)
head(accidents)
#
#
#
#
state_summary <- accidents %>%
  group_by(State) %>%
  summarise(Total_Accidents = n()) %>%
  arrange(desc(Total_Accidents)) %>%
  slice(1:10)

ggplot(state_summary, aes(x = reorder(State, Total_Accidents), y = Total_Accidents, fill = State)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 States by Number of Traffic Accidents",
       x = "State",
       y = "Number of Accidents") +
  theme_minimal() +
  theme(legend.position = "none")
#
#
#
#
