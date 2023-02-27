# data is located in local directory

pirates = get(load("pirates.RData"))

#1)
pirates_m_f = pirates[which(pirates$sex=='female' | pirates$sex=='male'), ]

ttest = t.test(beard.length ~ sex, data=pirates_m_f, var.equal = TRUE)

# the p-value (the probability of obtaining this test statistic given the null
# is true) is very small, it is ~ 0. 
# Thus, beards have significantly different lengths in male pirates and female pirates.

#2)
pirates_pixar = pirates[which(pirates$fav.pixar=='Up' | pirates$fav.pixar=='Inside Out'), ]

mytable = xtabs( ~ eyepatch + sex, data=pirates_pixar)

cstest <- chisq.test(mytable)

cstest$p.value

# the p-value (the probability of obtaining this test statistic given the null
# is true) is large, it is 0.854. 
# Thus, pirates whose favorite pixar movie is Up are not more or less likely to wear an eye patch than those whose favorite pixar movie is Inside Out.
