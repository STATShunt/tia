# the following code is indicative of what you need to do
# do not "cut and paste", rather, "run the code and think".
# then alter code carefully to answer the challenge's questions

###################################################
###  CHALLENGE 5
###################################################
x<-rnorm(10,99,20)  # not the x in the challenge!

## main idea is to resample from the rows (1:nrow(x)) of x many times ---> then use these index numbers to point to the data and make new bootstrap-samples.
nboot<-5 # number of bootstrap samples to take (you should do 10,000)
nsamp<-length(x) # make sure bootstrap sample is size as original

index_boot1<-sample(1:length(x),nsamp,replace = TRUE)
x; index_boot1

# question 1  
mean(x[index_boot1]) # mean of one bootstrap sample!

# question 2
# hint: use lapply to do things over and over
boot_list<-lapply(1:nboot,function(i){sample(1:length(x),nsamp,replace = TRUE)})
boot_list # same as in question one, repeated nboot times!

boot_mean<-lapply(boot_list,function(i){mean(x[i])}) # takes the means, based on each set of random index numbers
boot_mean_vector<-unlist(boot_mean) # trick to turn list into a vector
hist(boot_mean_vector)

# question 3
mean(boot_mean_vector) #hmm?  what is this converging to as the number of bootstrap samples increases???

# question 4
# hint: choose a reasonable range and report it ...
quantile(boot_mean_vector,.5) # median
quantile(boot_mean_vector,.975) # cut-off for 97.5% of the data ...






