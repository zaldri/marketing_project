full_table <- read.csv("~/Documents/GitHub_Repositories/marketing_project/walmart_weather_data/full_table.csv")

str_1 = full_table$store_nbr == 1
store_1 = full_table[str_1,]

## ridge
library(glmnet)
x=store_1[,-1]
x=store_1[,-3]
y=store_1$units

train = sample(1:nrow(x), nrow(x)/2)
test = (-train)
y.test = y[test]

lasso.mod = glmnet(x[train,], y[train], alpha = 1, lambda = grid)
plot(lasso.mod)

set.seed(1)
cv.out = cv.glmnet(x[train,], y[train], alpha=1)
plot(cv.out)
bestlam = cv.out$lambda.min
lasso.pred=predict(lasso.mod, s=bestlam, newx = x[test,])
mean((lasso.pred-y.test)^2)
out=glmnet(x,y,alpha=1, lambda=grid)
lasso.coef=predict(out,type="coefficients", s=bestlam)[1:20,]
lasso.coef
colnames(x)
