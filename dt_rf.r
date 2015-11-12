setwd("~/GitHub/marketing_project")
prod_5 = read.csv('product_5.csv')[,5:44]
prod_5_cat = prod_5[,-(2:18)]

library(tree)

cuts <- cut(prod_5_cat$units, breaks = c(-Inf,0,50,100,150,200,Inf),
            labels = c("Zero", "Lowewst", "Low", "Average", "High", "Highest"))
cuts <- as.data.frame(cuts)
prod_5_cat['tree_cat'] = cuts
prod_5_cat <- prod_5_cat[,-1]

tree.prod_5 = tree(tree_cat~., prod_5_cat)
summary(tree.prod_5)

library(randomForest)
set.seed(1)
bag.prod_5 = randomForest(tree_cat~., data = prod_5_cat, mtry = 10, importance = TRUE)
