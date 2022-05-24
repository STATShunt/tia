cat("\014")  # clean console window
rm(list=ls(pos=.GlobalEnv), pos=.GlobalEnv) # remove all variables and start again :)

# check: where is your working directory (this is where things will be saved)
getwd()

# this script contains all the bits and pieces needed to do Assignment 3 (Challenges 1 to 10) that you have not learned elsewhere

############################################################################################
##  read in data and view
############################################################################################

# data not to be used for assignment!

# read in raw file from GITHUB, formatted with columns set by a comma
xurl<-"https://raw.githubusercontent.com/STATShunt/tia/master/data/other_not_for_assignment/cannabis2/cannabis_not_for_assignment.csv"
x<-read.csv(file=xurl,check.names = FALSE,stringsAsFactors =TRUE)

#open data in an RStudio window (just for looking at ...)
View(x)

#overview of the columns within x
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
out_sum<-aggregate(cbind(CBDA,THCA)~treatment,data=x,FUN=fsum_simp)


# qqplot
hist(x$CBDA)
hist(x$THCA)
hist(rnorm(100000,0,1))

qqplot(x$CBDA,x$THCA)
plot(x$CBDA,x$THCA)

# qqplot versus normal
qqnorm(x$CBDA);qqline(x$CBDA)

# example of skewed and bimodal data (to central regions on hist) data
xskew_bimodal<-c(rpois(50,5),rpois(50,30)) # mixture of 50 poisson random variables with mean of 5 and 50 with a mean of 30 (see histogram)
hist(xskew_bimodal)
qqnorm(xskew_bimodal);qqline(xskew_bimodal) # not straight at all!

# example of fat tailed data (t with low df) (a bit like skewed both ways ...)
xfat<-rt(500,3) # symmetric but more chance of extreme values than normal
hist(xfat)
qqnorm(xfat);qqline(xfat) # not straight at all!


# correlations
cor(x$CBDA,x$THCA)
?cor
cor.test(x$CBDA,x$THCA)

cor(x$CBDA,x$THCA,method="pearson")
cor(x$CBDA,x$THCA,method="spearman")
cor(rank(x$CBDA),rank(x$THCA),method="pearson")

rank(x$CBDA)
x$CBDA



# make a new group by lumping a more fine-grained categorical variable
x$treat_group<-NA
x$treat_group[x$treatment%in%c("3","6","10")]<-"high"
x$treat_group[!x$treatment%in%c("3","6","10")]<-"low"



# basic boxplot
xsplit_group1<-split(x$CBDA,x$treat_group)
boxplot(xsplit_group1,main="CDBA")

xsplit_group2<-split(x$THCA,x$treat_group)
boxplot(xsplit_group2,main="THCA")



# summary of two numeric measures by group
xsum<-aggregate(cbind(CBDA,THCA)~treat_group,data=x,FUN=fsum_simp)
t(xsum)

#t-tests for each group
t.test(x$CBDA[x$treat_group=="high"],x$CBDA[x$treat_group=="low"])
t.test(CBDA~treat_group,data=x) # same but using function inputs

test_out<-t.test(x$CBDA[x$treat_group=="high"],x$CBDA[x$treat_group=="low"])
names(test_out) # what is in the output (it is a list with names!)
test_out$estimate
test_out$estimate[1]-test_out$estimate[2] # estimated diff in means ...
test_out$conf.int # confidence interval


#linear model (ANOVA)
mod0<-lm(CBDA~treat_group,data=x)
names(mod0) # what is in the linear regression output?

anova(mod0) # classical anova style output (F-test for H0: all groups have the same mean)
summary(mod0) # fitted values for model (see equation 9 on page 60 of Module Three notes where intercept is Beta0)
t.test(CBDA~treat_group,data=x) # WELCH t-test (assumes variance not the same)
t.test(CBDA~treat_group,data=x,var.equal = TRUE) # assumes variance are the same (more power if true) same as ANOVA with 2 factors

mod0$fitted.values # predictions from model
aggregate(CBDA~treat_group,data=x,FUN=fsum_simp) # so the model predicts group means!
data.frame(x$CBDA,x$treat_group,predict=mod0$fitted.values,res=mod0$residuals,error=x$CBDA-mod0$fitted.values)

names(mod0) # what is in the linear regression output?
qqnorm(mod0$residuals);qqline(mod0$residuals) # you assumed errors are normally distributed


#linear model (ANOVA) with a potential covariate (edge of greenhouse)
mod1<-lm(CBDA~treat_group+edge,data=x)
anova(mod1)
summary(mod1)


