#install.packages('dplyr')
#install.packages('data.table')
library('dplyr')
library('data.table')

# 1)
caffeine = read.table("caffeinestudy.tsv", header=TRUE, sep= "\t")

# 2)
men_caffeine = caffeine[caffeine$gender == 'male',]

men_caffeine_by_age = caffeine %>% group_by(age) %>% summarise(max_score = max(score))

# 3)
level_of_drink = caffeine %>% group_by(drink) %>% summarise(mean = mean(score), median = median(score), maximum = max(score), standard_deviation = sd(score))

# 4)
female_caffeine = caffeine[caffeine$gender == 'female',]
female_over_20_caffeine = female_caffeine[female_caffeine$age > 20,]

combined = female_over_20_caffeine %>% group_by(drink, cups) %>% summarise(mean = mean(score), median = median(score), maximum = max(score), standard_deviation = sd(score), number_of_people = n())

df = data.frame(combined)

tab = as.data.table(df, TRUE)