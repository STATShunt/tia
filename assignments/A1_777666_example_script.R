# This script is a skeleton for doing Assignment 1
# First, I suggest you uncomment the following row and use it in all your scripts (see Section 2.21 of the R notes)
# rm(list=ls(pos=.GlobalEnv), pos=.GlobalEnv) # remove everything and start again (just run all your code again!)


## Section 1

# 1.1
x<-rnorm(10)
x

# 1.2 ...




## Section 2

xlabs<- sample(c("high","low"),92, replace=TRUE)
set.seed(99)
xmeasurement<-rpois(92,10)
xplant<-data.frame(plantID=1:length(xlabs), fert=xlabs,height=xmeasurement)

View(xplant)  # take look (cannot edit)
str(xplant)   # summary of the object
dim(xplant)   # number of rows and columns (check)


# 2.1



# 2.2 ...





## Section 3

# read in raw file from GITHUB, formatted with columns set by a comma
xurl<-"https://raw.githubusercontent.com/STATShunt/tia/"
xurl<-paste0(xurl,"master/data/cannabis/data_buds.csv")
xbud<-read.csv(file=xurl,check.names = FALSE,stringsAsFactors =TRUE)

# question 3.1




# question 3.2 ...



