library(tidyverse)
library(sysfonts)
library(showtext)    

font_add_google("Roboto", family = "roboto")
showtext_auto()   

countries_2 <- c("Germany", "United Kingdom")
my_colors <- c("Germany" = "#1A8F1A", "United Kingdom" = "#9E64D1")

uk_bar <- euro_flights %>%
  filter(state_name %in% countries_2, year %in% c(2019, 2020, 2021, 2022)) %>%
  group_by(state_name, year) %>%
  summarize(avg_flt_dep = mean(flt_dep_1), .groups = "drop") %>%
  ggplot(aes(x = year, y = avg_flt_dep)) +
  geom_col(aes(fill = state_name), position = position_dodge2(padding = 0.1)) +
  geom_text(
    aes(label = round(avg_flt_dep, 1), group = state_name),
    position = position_dodge(width = 0.9),
    vjust = 1.5,
    size = 4,
    color = "white"
  ) + 
  scale_fill_manual(values = my_colors) +
  labs(
    title = "Average Flights From the UK and Germany (2019–2022)",
    x = "Year",
    y = "Average Flight Departures",
    fill = "Country"
  ) + 
  theme_minimal() + 
  theme(
    text = element_text(family = "roboto"), 
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    legend.position = c(1, 1),
    legend.justification = c(1,1),
    legend.title = element_text(face = "bold"),
    legend.background = element_rect(color = "black"),
    axis.title.x = element_text(face = "bold"), 
    axis.title.y = element_text(face = "bold"), 
    plot.background = element_rect(fill = "grey90", color = "black"), 
    panel.background = element_rect(color = "black")
  )

showtext_opts(dpi = 300)

ggsave(
  "plots/uk_bar.png", 
  uk_bar, 
  width = 10,
  height = 6,
  dpi = 300,
  units = "in"
)


