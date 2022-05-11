# the following code is indicative of what you need to do
# do not "cut and paste", rather, "run the code and think".
# then alter code carefully to answer the challenge's questions

###################################################
###  CHALLENGE 9
###################################################

### question 1 ## generate 1000 samples for rnorm of length n =10, mean= 0, sd=1 
mu_true<-0
mysamp<-lapply(1:1000, function(i){rnorm(n=16,mean=mu_true,sd=10)})
mysamp[[1]] # first element
mysamp[[2]] # second element
length(mysamp)

### question 2

# test on one sample
t.test(mysamp[[1]])

# test all 1000 samples and put results into list
#lapply(mysamp,function(i){mean(i)})  # mean of each sample ... as an example of lapply
mysamp_tests<-lapply(mysamp,function(i){t.test(i)})

# take a look at what is in a t.test() output
mysamp_tests[[1]]
names(mysamp_tests[[1]]) # every element of the list output ... by name
mysamp_tests[[1]]$estimate # this is the mean
mysamp_tests[[1]]$conf.int
mysamp_tests[[1]]$conf.int[1]
mysamp_tests[[1]]$conf.int[2]

mysamp_CI_upper<-unlist(lapply(mysamp_tests,function(i){i$conf.int[2]})) # unlist puts single numbers in list into a vector
mysamp_CI_lower<-unlist(lapply(mysamp_tests,function(i){i$conf.int[1]})) 
# for the p-value, just find the correct name and store as a vector (using unlist)


# question 3
mu0<-0 # hypothesised mean
data.frame(mysamp_CI_lower,mysamp_CI_upper,mu0
           ,indicate=mysamp_CI_lower<mu0&mu0<mysamp_CI_upper)  # the sort of info you need to count up ...
# answer needs to count the number of values within "indicate" above


# question 4
# use the p-value vector from q2

# question 5
# refer to the results of q3 and q4, and read the notes carefully.




