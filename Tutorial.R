setwd("~/Downloads/Git/coursera/Assignment 1/")
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

list.files("diet_data")
andy <- read.csv("diet_data/Andy.csv")
head(andy)
length(andy$Day)
dim(andy)
str(andy)
summary(andy)
names(andy)

andy[1, "Weight"]
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]

subset(andy$Weight, andy$Day==30)
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

andy_loss <- andy_start - andy_end
andy_loss
list.files()
files <- list.files("diet_data")
files

files[1]
files[2]
files[3:5]
setwd("diet_data")
head(read.csv(files[3]))

list.files()

setwd("..")
files_full <- list.files("diet_data", full.names=TRUE)
files_full

head(read.csv(files_full[3]))
andy_david <- rbind(andy, read.csv(files_full[2]))
andy_david
head(andy_david)
tail(andy_david)
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

for (i in 1:5) {print(i)}
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}

dat[which(dat$Day == 25),]
mean(dat$Weight, na.rm = TRUE)
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
summary(dat)
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)

weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:5) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}

weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)

summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)


for (i in seq_along(files_full)) {
  tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

tmp <- str(lapply(files_full, read.csv))
?lapply
output <- do.call(rbind, tmp)
str(output)
output_subset = output[which(output[,"Day"]== 20),]
median(output_subset[, "Weight"], na.rm=TRUE)
