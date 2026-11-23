library(tidyverse)
library(sysfonts)
library(showtext)    


font_add_google("Roboto", family = "roboto")
showtext_auto()   


uk_heatmap <- euro_flights %>%
  filter(state_name == "United Kingdom") %>%
  group_by(year, month_num) %>%
  summarize(total = sum(flt_tot_1), .groups = "drop") %>%
  ggplot(aes(x = factor(month_num), y = factor(year), fill = total)) +
  geom_tile(color = "white") +
  scale_fill_viridis_c(option = "plasma") +
  scale_x_discrete(
    labels = month.abb, 
    expand = c(0, 0)
  ) +
  scale_y_discrete(expand = c(0, 0)) + 
  labs(
    title = "UK Total Flight Volume by Month and Year",
    subtitle = "Jan 2016 - May 2022", 
    x = "Month",
    y = "Year",
    fill = "Total Flights"
  ) +
  theme_minimal() + 
  theme(
    text = element_text(family = "roboto"), 
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    legend.title = element_text(face = "bold"),
    legend.background = element_rect(color = "black"),
    axis.title.x = element_text(face = "bold"), 
    axis.title.y = element_text(face = "bold"), 
    plot.background = element_rect(fill = "grey90", color = "black"), 
    panel.background = element_rect(color = "black")
  )

showtext_opts(dpi = 300)

ggsave(
  "plots/uk_heatmap.png", 
  uk_heatmap, 
  width = 10,
  height = 6,
  dpi = 300,
  units = "in"
)

