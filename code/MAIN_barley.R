cat("\014")  # clean console window
rm(list=ls(pos=.GlobalEnv), pos=.GlobalEnv) # remove all variables and start again :)

# check: where is your working directory (this is where things will be saved)
getwd()

############################################################################################
##  read in data and view
############################################################################################

# read in raw file, formatted with columns set by a comma
#x<-read.csv(file="data_barley.csv",check.names = FALSE,stringsAsFactors =TRUE) # assumes clean CSV file in working directory

# read in raw file from GITHUB, formatted with columns set by a comma
xurl<-"https://raw.githubusercontent.com/STATShunt/tia/master/data/barley/data_barley.csv"
x<-read.csv(file=xurl,check.names = FALSE,stringsAsFactors =TRUE)

#open data in an RStudio window (just for looking at ...)
View(x)

#overview of the columns within xbud
str(x) 

############################################################################################
##  summarise data
############################################################################################

# make a simple summary function
fsum_simp<-function(i){
  out<-c(length(i),mean(i),sd(i))
  names(out)<-c("n","mean","sd")
  out
  }

# summarise
out_sum<-aggregate(yield~treatment*variety,data=x,FUN=fsum_simp)

#output to working directory
write.table(file="summary_stats_example_barley.csv",out_sum,sep=",",row.names = FALSE)



