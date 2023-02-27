# 1
df <- data.frame(name = c("Astrid", "Lea", "Sarina", "Remon", "Letizi", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"),
                    sex = c("F", "F", "F", "M", "F", "F", "M", "F", "F", "F"),
                    age = c(30, 23, 25, 29, 22, 22, 35, 19, 32, 21),
                    superhero = c("Batman", "Superman", "Batman", "Spiderman", "Batman", "Antman", "Batman", "Superman", "Maggott", "Superman"),
                    tattoos = c(11, 15, 12, 5, 65, 3, 9, 13, 900, 0),
                    stringsAsFactors = FALSE)   # Don't convert strings to factors!

# 2
median(df$age)

# 3
female_df = df[df$sex=="F",]
mean(female_df$age)
male_df = df[df$sex=="M",]
mean(male_df$age)

# 4
male_df = df[df$sex=="M",]
max(male_df$tattoos)

# 5
under_32_df = df[df$age<32,]
under_32_female_df = under_32_df[under_32_df$sex=="F",]

nrow(under_32_female_df) / nrow(under_32_df)

# 6
female_df = df[df$sex=="F",]
female_under_32_df = female_df[female_df$age<32,]

nrow(female_under_32_df) / nrow(female_df)

# 7
df$tattoos.per.year = df$tattoos / df$age

# 8
max_num_of_tats_per_year = max(df$tattoos.per.year)
df$name[df$tattoos.per.year==max_num_of_tats_per_year]

# 9
female_df = df[df$sex=="F",]

female_df$name[female_df$superhero=="Superman"]

# 10
over_20_df = df[df$age>20,]
over_20_superman_df = over_20_df[over_20_df$superhero=="Spiderman",]

median(over_20_superman_df$tattoos)







