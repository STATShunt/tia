# the following code is indicative of what you need to do
# do not "cut and paste", rather, "run the code and think".
# then alter code carefully to answer the challenge's questions

###################################################
###  CHALLENGE 8
###################################################


# question 1
# straight-forward (use whatever names you wish)

# question 2
# straight-forward (use whatever name you wish)

tstat<-1.5  # do not do this - your answer should be dynamic

# question 3

# examples of quantiles for different sample sizes etc
qt(.025,3)
qt(.025,30)
qt(.025,1000)

qt(.025,9) # left hand side cut-off for a standard two-sided t-test ...
qt(.5,9) # median

pt(0,9)
pt(qt(.025,30),30)


# question 4

# should get the same as t.test()
2*(1-pt(.66,14)) # example from the notes.


