setwd("~/GitHub/marketing_project")
prod_5 = read.csv('product_5.csv')[,5:44]
prod_5_regression = lm(units~., data = prod_5)
summary(prod_5_regression)
## RA (rain)
## FZ (freezing)
## BR (mist)
## HZ (haze)
## DZ (drizle) - 10.26
## BC (patches) - 27.99

prod_9 = read.csv('product_9.csv')[,5:44]
prod_9_regression = lm(units~., data = prod_9)
summary(prod_9_regression)
## FG (fog)
## MI (shallow)
## VC (vicinity) - 0.01

prod_45 = read.csv('product_45.csv')[,5:44]
prod_45_regression = lm(units~., data = prod_45)
summary(prod_45_regression)
## FZ (freezing)
## FG (fog)
## BR (mist)
## TS (thunderstorm)
## DZ (drizzle)