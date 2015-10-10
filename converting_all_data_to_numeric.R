walmart <- read.csv("~/Documents/GitHub_Repositories/marketing_project/walmart.csv", stringsAsFactors=FALSE)
names(walmart)

#tmax
walmart$tmax[walmart$tmax == 'M'] <- 0
walmart$tmax <- as.numeric(walmart$tmax)
mean(walmart$tmax)

#tmin
walmart$tmin[walmart$tmin == 'M'] <- 0
walmart$tmin <- as.numeric(walmart$tmin)
mean(walmart$tmin)

#tavg
walmart$tavg[walmart$tavg == 'M'] <- 0
walmart$tavg <- as.numeric(walmart$tavg)
mean(walmart$tavg)

#depart
walmart$depart[walmart$depart == 'M'] <- 0
walmart$depart <- as.numeric(walmart$depart)
mean(walmart$depart)

#dewpoint
walmart$dewpoint[walmart$dewpoint == 'M'] <- 0
walmart$dewpoint <- as.numeric(walmart$dewpoint)
mean(walmart$dewpoint)

#wetbulb
walmart$wetbulb[walmart$wetbulb == 'M'] <- 0
walmart$wetbulb <- as.numeric(walmart$wetbulb)
mean(walmart$wetbulb)

#heat
walmart$heat[walmart$heat == 'M'] <- 0
walmart$heat <- as.numeric(walmart$heat)
mean(walmart$heat)

#cool
walmart$cool[walmart$cool == 'M'] <- 0
walmart$cool <- as.numeric(walmart$cool)
mean(walmart$cool)

#sunrise
walmart$sunrise[walmart$sunrise == 'M'] <- 0
walmart$sunrise[walmart$sunrise == '-'] <- 0
walmart$sunrise <- as.numeric(walmart$sunrise)
mean(walmart$sunrise)

#sunset
walmart$sunset[walmart$sunset == 'M'] <- 0
walmart$sunset[walmart$sunset == '-'] <- 0
walmart$sunset <- as.numeric(walmart$sunset)
mean(walmart$sunset)

#snowfall
walmart$snowfall[walmart$snowfall == 'M'] <- 0
walmart$snowfall[walmart$snowfall == '  T'] <- 0 # two spaces
walmart$snowfall <- as.numeric(walmart$snowfall)
mean(walmart$snowfall)

#perciptotal
walmart$perciptotal[walmart$perciptotal == 'M'] <- 0
walmart$perciptotal[walmart$perciptotal == '  T'] <- 0 # two spaces
walmart$perciptotal <- as.numeric(walmart$perciptotal)
mean(walmart$perciptotal)

#stnpressure
walmart$stnpressure[walmart$stnpressure == 'M'] <- 0
walmart$stnpressure <- as.numeric(walmart$stnpressure)
mean(walmart$stnpressure)

#sealevel
walmart$sealevel[walmart$sealevel == 'M'] <- 0
walmart$sealevel <- as.numeric(walmart$sealevel)
mean(walmart$sealevel)

#resultspeed
walmart$resultspeed[walmart$resultspeed == 'M'] <- 0
walmart$resultspeed <- as.numeric(walmart$resultspeed)
mean(walmart$resultspeed)

#resultdir
walmart$resultdir[walmart$resultdir == 'M'] <- 0
walmart$resultdir <- as.numeric(walmart$resultdir)
mean(walmart$resultdir)

#avgspeed
walmart$avgspeed[walmart$avgspeed == 'M'] <- 0
walmart$avgspeed <- as.numeric(walmart$avgspeed)
mean(walmart$avgspeed)

str(walmart)
## numeric csv
write.csv(walmart, "walmart_numeric.csv", row.names = F)
