store_15_full = read.csv('store_15.csv')
ggplot(store_15_full, aes(x = date, y = units, colour = item_nbr, group = item_nbr)) + geom_point() + geom_smooth(aes(group = 1)) + geom_smooth(method = 'lm', color = 'red', aes(group = 1))
ggplot(store_15_full, aes(x = date, y = units, colour = factor(item_nbr), group = factor(item_nbr))) + geom_point() + geom_smooth(aes(group = 1)) + stat_smooth() + ggtitle('Store 15 product sales by day')


store_32_full = read.csv('store_32.csv')
ggplot(store_32_full, aes(x = date, y = units, colour = item_nbr, group = item_nbr)) + geom_point() + geom_smooth(aes(group = 1)) + geom_smooth(method = 'lm', color = 'red', aes(group = 1))
ggplot(store_32_full, aes(x = date, y = units, colour = factor(item_nbr), group = factor(item_nbr))) + geom_point() + geom_smooth(aes(group = 1)) + stat_smooth() + ggtitle('Store 32 product sales by day')


store_37_full = read.csv('store_37.csv')
ggplot(store_37_full, aes(x = date, y = units, colour = item_nbr, group = item_nbr)) + geom_point() + geom_smooth(aes(group = 1)) + geom_smooth(method = 'lm', color = 'red', aes(group = 1))
ggplot(store_37_full, aes(x = date, y = units, colour = factor(item_nbr), group = factor(item_nbr))) + geom_point() + geom_smooth(aes(group = 1)) + stat_smooth() + ggtitle('Store 37 product sales by day')


store_37_edited <- sqldf('select * from store_37_full where units < 2000')
ggplot(store_37_edited, aes(x = date, y = units, colour = item_nbr, group = item_nbr)) + geom_point() + geom_smooth(aes(group = 1)) + geom_smooth(method = 'lm', color = 'red', aes(group = 1))
ggplot(store_37_edited, aes(x = date, y = units, colour = factor(item_nbr), group = factor(item_nbr))) + geom_point() + geom_smooth(aes(group = 1)) + stat_smooth() + ggtitle('Store 37 product sales by day')
