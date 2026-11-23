library(tidyverse)
library(lubridate)


euro_flights %>% 
  group_by(state_name) %>% 
  summarise(
    avg_flt_dep = mean(flt_dep_1), 
    avg_flt_arr = mean(flt_arr_1), 
    avg_flt_tot = mean(flt_tot_1), 
  ) %>% 
  arrange(desc(avg_flt_dep))
