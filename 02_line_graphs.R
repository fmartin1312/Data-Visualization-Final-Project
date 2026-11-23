library(tidyverse)
library(sysfonts)
library(showtext)     


countries <- c("Denmark", "Türkiye", "Finland", "Switzerland",
               "Germany")

font_add_google("Roboto", family = "roboto")
showtext_auto()   

top_5 <- euro_flights %>% 
  filter(state_name %in% countries) %>% 
  group_by(state_name, year) %>% 
  summarise(avg_flt_dep = mean(flt_dep_1), .groups = "drop") %>% 
  ggplot(aes(x = year, y = avg_flt_dep)) + 
  geom_line(aes(color = state_name)) + 
  geom_point(aes(color = state_name), shape = 8, show.legend = FALSE) + 
  scale_x_continuous(
    breaks = seq(2016, 2022, by = 1),
  ) +
  scale_y_continuous(
    breaks = seq(100, 400, by = 50),
  ) +
  labs(
    title = "Average Flight Departures from European Countries (2016-2022)", 
    subtitle = "Top 5 Countries with the Most Departures", 
    x = NULL, 
    y = "Average Flight Departures", 
    color = "Country"
  ) +
  theme_minimal() + 
  theme(
    text = element_text(family = "roboto"), 
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    legend.position = "bottom",
    legend.direction = "horizontal", 
    legend.title = element_text(face = "bold"),
    legend.background = element_rect(color = "black"),
    axis.title.x = element_text(face = "bold"), 
    axis.title.y = element_text(face = "bold"), 
    plot.background = element_rect(fill = "grey90", color = "black"), 
    panel.background = element_rect(color = "black")
  )

showtext_opts(dpi = 300)

ggsave(
  "plots/top_5_line.png", 
  top_5, 
  width = 10,
  height = 6,
  dpi = 300,
  units = "in"
)

