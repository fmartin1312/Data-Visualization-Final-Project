## Datasets

This is the folder that has the data sets that I used to create my graphics. 

- `European_Flights_Dataset.csv`: original, unedited data set that was uploaded from `kaggle`
  - [Link to original source](https://www.kaggle.com/datasets/muqaddasejaz/european-flights-dataset?resource=download)
- `euro_flights_clean.csv`: cleaned data set, that has standardized column names and no redundant columns

## Codebook for Cleaned Data
 - `year`: reference year
 - `month_num`: month in numeric format
 - `month_mon`: month abbreviation
 - `flt_date`: date of flight record
 - `apt_icao`: ICAO airport code (4-letter identifier)
 - `apt_name`: name of the airport
 - `state_name`: country where airport is located
 - `flt_dep_1`: number of IFR departures
 - `flt_arr_1`: number of IFR arrivals
 - `flt_tot_1`: total IFR movements (departures + arrivals)
 - `pivot_label`: combination of airport name and ICAO code