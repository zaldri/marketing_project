## Please use the walmart_numeric dataset 
## the results of these queries should be 41600 observations (rows) each

wmt = read.csv('walmart_numeric.csv')

## product related data
product_5 = sqldf('select * from wmt where item_nbr = 5')
write.csv(product_5, file = 'product_5.csv', row.names = FALSE)

product_9 = sqldf('select * from wmt where item_nbr = 9')
write.csv(product_9, file = 'product_9.csv', row.names = FALSE)

product_45 = sqldf('select * from wmt where item_nbr = 45')
write.csv(product_45, file = 'product_45.csv', row.names = FALSE)