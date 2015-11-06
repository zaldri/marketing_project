library(glmnet)

## lasso product_5
prod_5 = read.csv('product_5.csv')[,5:44]

x = model.matrix(units~., prod_5)
y = prod_5$units

set.seed(1)
train = sample(1:nrow(x), nrow(x)/2)
test = (-train)
y.test = y[test]
  
grid = 10^seq(10,-2,length=100)
  
lasso.mod_5 = glmnet(x[train,], y[train], alpha = 1, lambda = grid)
plot(lasso.mod_5)
cv.out_5 = cv.glmnet(x[train,], y[train], alpha = 1)
plot(cv.out_5)
bestlam_5 = cv.out_5$lambda.min
bestlam_5
  
out_5 = glmnet(x,y, alpha=1, lambda = grid)
lasso.coef_5 = predict(out_5, type="coefficients", s = bestlam_5)
lasso.coef_5

## lasso product_9
prod_9 = read.csv('product_9.csv')[,5:44]

x = model.matrix(units~., prod_9)
y = prod_9$units

set.seed(1)
train = sample(1:nrow(x), nrow(x)/2)
test = (-train)
y.test = y[test]

grid = 10^seq(10,-2,length=100)

lasso.mod_9 = glmnet(x[train,], y[train], alpha = 1, lambda = grid)
plot(lasso.mod_9)
cv.out_9 = cv.glmnet(x[train,], y[train], alpha = 1)
plot(cv.out_9)
bestlam_9 = cv.out_9$lambda.min

out_9 = glmnet(x,y, alpha=1, lambda = grid)
lasso.coef_9 = predict(out_9, type="coefficients", s = bestlam_9)
lasso.coef_9


## lasso product_45
prod_45 = read.csv('product_45.csv')[,5:44]

x = model.matrix(units~., prod_45)
y = prod_45$units

set.seed(1)
train = sample(1:nrow(x), nrow(x)/2)
test = (-train)
y.test = y[test]

grid = 10^seq(10,-2,length=100)

lasso.mod_45 = glmnet(x[train,], y[train], alpha = 1, lambda = grid)
plot(lasso.mod_45)
cv.out_45 = cv.glmnet(x[train,], y[train], alpha = 1)
plot(cv.out_45)
bestlam_45 = cv.out_45$lambda.min
bestlam_45

out_45 = glmnet(x,y, alpha=1, lambda = grid)
lasso.coef_45 = predict(out_45, type="coefficients", s = bestlam_45)
lasso.coef_45



