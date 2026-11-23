library(tidyverse)
library(lubridate)


euro_flights <- read_csv("data/European_Flights_Dataset.csv") %>% 
  janitor::clean_names() %>% 
  select(
    -flt_dep_ifr_2, 
    -flt_arr_ifr_2, 
    -flt_tot_ifr_2
    ) %>% 
  mutate(
    flt_date = as.Date(flt_date)
  )


write_csv(euro_flights, file = "data/euro_flights_clean.csv")

