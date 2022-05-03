# the following code is indicative of what you need to do
# do not "cut and paste", rather, "run the code and think".
# then alter code carefully to answer the challenge's questions

###################################################
###  CHALLENGE 6
###################################################

y<-rnorm(13,-10,3) # not the data in the question

# question 1
mu0<- -9
muhat<-mean(y)
sigmahat2<-var(y)
n<-length(y)

mu0;muhat;sigmahat2;n

# question 2
tstat<-(muhat-mu0)/sqrt(sigmahat2/n)
tstat # is this number "extreme" in absolute value if the null hypothesis is true?

# our null hypothesis is H0: mu0 = -9  i.e. "true mean of y is equal to -9"

# question 3
t.test(y,mu=mu0)  # look for the value of "t" which is the test statistic
