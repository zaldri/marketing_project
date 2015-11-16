library(nlme)
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

four_stores$id = seq.int(nrow(four_stores))
weather = four_stores[,c(1:7,9:12,15:21)]
small = four_stores[,c(2:51)]


#Multilevel Model
#individuals = every date
#group = store

#compareModels <- function(cut.off) { 
  stores.train <- subset(four_stores, as.Date(four_stores[,1], origin = '1900-01-01') < "2014-01-01") 
  stores.test <- subset(four_stores, as.Date(four_stores[,1], origin = '1900-01-01') >= "2014-01-01") 
  n.test <- 0 
  mse.indv <- 0 
## local models 
  for(key in unique(four_stores$id)){ 
    indv <- subset(four_stores, id==key) 
    indv.train <- subset(indv, as.Date(four_stores[,1], origin = '1900-01-01') < "2014-01-01") 
    indv.test <- subset(indv, as.Date(four_stores[,1], origin = '1900-01-01') >= "2014-01-01")
    units.hat <- predict(lm(units~., indv.train[,c(2:51)]), newdata=indv.test) 
    ## add the mse from the individual-level prediction 
    mse.indv <- mse.indv + sum((indv.test$units - units.hat)**2) 
    n.test <- n.test + nrow(indv.test) 
  } 
  local.mse <- mse.indv/n.test 
  # predict using generalized model 
  units.hat <- predict(lm(units~., stores.train[,c(2:51)]), stores.test) 
  global.mse <- mean((stores.test$units - units.hat)**2) 
  # multi-level model 
  multi <- lme(units~., data=stores.train[,c(2:51)], random=list(id=pdDiag(~stores.train[,c(2,3,5:51)]))) 
  ml.mse <- mean((predict(multi, newdata=stores.test, level=1) - stores.test$units)**2)
  #return(data.frame(Cutoff=cut.off, Global=global.mse, Local=local.mse, Multilevel=ml.mse)) 
#}

#compareModels("2014-01-01")


  MLM
  library(nlme)
  #individual level: products
  #group level: stores
  #indep. variables: precip total, cool, date
  #dep. variable: units
  
  store_15 = read.csv('store_15.csv')
  store_32 = read.csv('store_32.csv')
  store_35 = read.csv('store_35.csv')
  store_37 = read.csv('store_37.csv')
  two_stores = rbind(store_15, store_32)
  two1_stores = rbind(store_35, store_37)
  four_stores = rbind(two_stores,two1_stores)
  four_stores = four_stores[,c(3:52)]
  
  stores = four_stores[,c(1:4,12,16,44:50)]
  stores_mini = stores[,c(1:6)]
  stores$date = as.Date(stores$date, origin = '1900-01-01')
  
  
  #compareModels <- function(cut.off) {
  stores.train <- subset(stores, date < "2014-01-01")
  stores.test <- subset(stores, date >= "2014-01-01")
  n.test <- 0
  mse.indv <- 0
  ## local models
  for(key in unique(stores$item_nbr)){
    indv <- subset(stores, item_nbr==key)
    indv.train <- subset(indv, date < "2014-01-01")
    indv.test <- subset(indv, date >= "2014-01-01")
    units.hat <- predict(lm(units~., indv.train), newdata=indv.test)
    ## add the mse from the individual-level prediction
    mse.indv <- mse.indv + sum((indv.test$units - units.hat)**2)
    n.test <- n.test + nrow(indv.test)
  }
  local.mse <- mse.indv/n.test
  # predict using generalized model
  units.hat <- predict(lm(units~., stores.train), stores.test)
  global.mse <- mean((stores.test$units - units.hat)**2)
  # multi-level model
  multi <- lme(units~., data=stores.train, random = ~1|units)
  ml.mse <- mean((predict(multi, newdata=stores.test, level=1) - stores.test$units)**2)
  #return(data.frame(Cutoff=cut.off, Global=global.mse, Local=local.mse, Multilevel=ml.mse))
  #}
  
  df <- data.frame(Global=global.mse, Local=local.mse)
  
  n <- names(stores)
  f <- as.formula(paste("units ~", paste(n[!n %in% "units"], collapse = " + ")))
  f

