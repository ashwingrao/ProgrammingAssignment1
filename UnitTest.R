

source("pollutantmean.R")
pollutantmean(directory = "specdata", pollutant = "nitrate")
#pollutantmeanBetter(directory = "specdata", pollutant = "nitrate")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
#pollutantmeanFirstCut("specdata", "nitrate", 23)
pollutantmean("specdata", "nitrate", 23)

source("complete.R")
#complete("specdata")
complete("specdata", 1)
completeNew("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
completeNew("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
completeNew("specdata", 30:25)
complete("specdata", 3)
completeNew("specdata", 3)
#completeNew("specdata")
complete("specdata", c(2, 4, 8, 10, 12))

source("corr.R")

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
head(cr)
summary(cr)


cr <- corr("specdata")
head(cr)
summary(cr)