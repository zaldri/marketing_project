weather_data = read.csv('weather.csv')
product_train = read.csv('train.csv')
key_data = read.csv('key.csv')


weather_df = data.frame(weather_data)
product_df = data.frame(product_train)
key_df = data.frame(key_data)


library(sqldf) # dont forget to install fitst!

# create table adding store number to the weather readouts for each station
weather_store_nbr <- sqldf('select weather_df.*, key_df.store_nbr from weather_df, key_df where weather_df.station_nbr = key_df.station_nbr')

only_weather <- weather_store_nbr[,-1] # remove weather station number

# create table combining the product information to the weather readouts based on store_nber and date
full_table <- sqldf('select product_df.*, only_weather.* from product_df, only_weather where product_df.store_nbr = only_weather.store_nbr and product_df.date = only_weather.date')

full_table = full_table[,-5] # remove duplicate date

full_table = full_table[,-23] # reomve duplicate store number


write.csv(full_table, file = "full_table.csv", row.names=FALSE) # writes full_table query output to csv
