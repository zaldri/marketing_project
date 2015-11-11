store_15 = read.csv('store_15.csv')
store_32 = read.csv('store_32.csv')
store_35 = read.csv('store_35.csv')
store_37 = read.csv('store_37.csv')
two_stores = rbind(store_15, store_32)
two1_stores = rbind(store_35, store_37)
four_stores = rbind(two_stores,two1_stores)
four_stores = four_stores[,c(3:52)]


#dates = 2012-01-01 - 2014-10-31
#train = 2012-01-01 - 2014-01-01
#test = 2014-01-01 - 2014-10-31

train = data.frame(date=as.Date(character()), store_nbr = double(), item_nbr = double(),
                   units = double(), tmax = double(), tmin = double(), tavg = double(),
                   depart=double(), dewpoint=double(), wetbult=double(), heat=double(), cool = double(),
                   sunrise=double(), sunset=double(), snowfall=double(), perciptotal=double(),
                   stnpressure=double(),sealevel=double(),resultspeed=double(),resultdir=double(),
                   avgspeed=double(), RA=double(), FZ=double(), FG=double(), BR=double(), UP=double(),
                   MI=double(), SN=double(), HZ=double(), VC=double(), TS=double(), DZ=double(),
                   BL=double(),BC=double(),DU=double(),SQ=double(),PL=double(),FU=double(), GR=double(),
                   GS=double(), SG=double(), PR=double(), FG2=double(), is_weekend=double(),
                   is_holiday=double(), is_holiday_weekday=double(), is_holiday_weekend=double(),
                   spring=double(), summer=double(), fall=double())

test = data.frame(date=as.Date(character()), store_nbr = double(), item_nbr = double(),
                  units = double(), tmax = double(), tmin = double(), tavg = double(),
                  depart=double(), dewpoint=double(), wetbult=double(), heat=double(), cool = double(),
                  sunrise=double(), sunset=double(), snowfall=double(), perciptotal=double(),
                  stnpressure=double(),sealevel=double(),resultspeed=double(),resultdir=double(),
                  avgspeed=double(), RA=double(), FZ=double(), FG=double(), BR=double(), UP=double(),
                  MI=double(), SN=double(), HZ=double(), VC=double(), TS=double(), DZ=double(),
                  BL=double(),BC=double(),DU=double(),SQ=double(),PL=double(),FU=double(), GR=double(),
                  GS=double(), SG=double(), PR=double(), FG2=double(), is_weekend=double(),
                  is_holiday=double(), is_holiday_weekday=double(), is_holiday_weekend=double(),
                  spring=double(), summer=double(), fall=double())

for (i in 1:nrow(four_stores)){
  if (as.Date(four_stores[i,1], origin = '1900-01-01') < "2014-01-01"){
    x = four_stores[i,]
    train = rbind(train, x)
  }
  else{
    y = four_stores[i,]
    test = rbind(test, y)
  }
}