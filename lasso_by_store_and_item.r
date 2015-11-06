walmart_data = read.csv('walmart_numeric.csv')[,3:44]


library(glmnet)

## Lasso - Units Sold by Store_Nbr
store_coef_table = NULL
for (str_nbr in seq(1:45)) {
  store_subset = subset(walmart_data, walmart_data$store_nbr == str_nbr)
  x = model.matrix(units~.-store_nbr-item_nbr, store_subset)
  y = store_subset$units
  
  set.seed(1)
  train = sample(1:nrow(x), nrow(x)/2)
  test = (-train)
  y.test = y[test]
  
  grid = 10^seq(10,-2,length=100)
  
  lasso.mod = glmnet(x[train,], y[train], alpha = 1, lambda = grid)
  #plot(lasso.mod)
  cv.out = cv.glmnet(x[train,], y[train], alpha = 1)
  #plot(cv.out)
  bestlam = cv.out$lambda.min
  
  out=glmnet(x,y, alpha=1, lambda = grid)
  lasso.coef = predict(out, type="coefficients", s = bestlam)
  coef = t((as.matrix(lasso.coef)))
  store_coef_table = rbind(store_coef_table, coef)
}
write.csv(store_coef_table, file = 'store_coef_table.csv', row.names = FALSE)


## Lasso - Units Sold by Item_Nbr
item_coef_table = NULL
for (product_number in seq(1:111)) {
  store_subset = subset(walmart_data, walmart_data$item_nbr == product_number)
  x = model.matrix(units~.-store_nbr-item_nbr, store_subset)
  y = store_subset$units
  
  set.seed(1)
  train = sample(1:nrow(x), nrow(x)/2)
  test = (-train)
  y.test = y[test]
  
  grid = 10^seq(10,-2,length=100)
  
  lasso.mod = glmnet(x[train,], y[train], alpha = 1, lambda = grid)
  #plot(lasso.mod)
  cv.out = cv.glmnet(x[train,], y[train], alpha = 1)
  #plot(cv.out)
  bestlam = cv.out$lambda.min
  
  out=glmnet(x,y, alpha=1, lambda = grid)
  lasso.coef = predict(out, type="coefficients", s = bestlam)
  coef = t((as.matrix(lasso.coef)))
  item_coef_table = rbind(item_coef_table, coef)
}
write.csv(item_coef_table, file = 'item_coef_table.csv', row.names = FALSE)
