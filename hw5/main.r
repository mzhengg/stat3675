auction = get(load("auction.RData"))

# 1)
jbb.cannon.lm = lm(formula = jbb ~ cannons, data = auction)

# each additional cannon adds 100.748 to the JBB value of the ship

# 2)
jbb.cannon.lm.modern = lm(formula = jbb ~ cannons, data = subset(auction, style == "modern"))

jbb.cannon.lm.classic = lm(formula = jbb ~ cannons,  data = subset(auction, style == "classic"))

# no; for modern ships, cannons add 99.83 to the JBB value of the ship
# while for classic ships, cannons addd 103.6 to the JBB value of the ship

# 3)
int.lm = lm(formula = jbb ~ style * age, data = auction)

summary(int.lm)

# the p-value for the interaction term between style and age is 0.000622
# which is very small (<0.05), therefore there is a signifigant interaction
# between a ship's style and age on JBB value

# the influence of style on JBB keeps varying based on the age, and vice versa

# 4)
jbb.all.lm = lm(jbb ~ cannons + rooms + age + condition + color + style, data = auction)

summary(jbb.all.lm)

# cannons, rooms, age, condition, and style signifigantly affect a ship's JBB value
# because their p-values are very small (<0.05)

# 5)
price.all.lm = lm(price ~ cannons + rooms + age + condition + color + style, data = auction)

summary(price.all.lm)

# JBB does a good job of capturing the effect of each variable on a ship’s selling price
# because the R-squared value of 0.8125 is close to 1 (meaning 81.25% of the variation in the model can be explained by the variables)
# and every variable, except for 'colorplum', is significant in the model at the 0.05 signifigance level

# 6
auction$price.gt.3500 = auction$price > 3500

price.all.blr = glm(price.gt.3500 ~ cannons + rooms + age + condition + color + style, data=auction, family=binomial)

# 7
new_ships = data.frame(cannons = c(12, 8, 32), rooms = c(34, 26, 65), age = c(43, 54, 100), condition = c(7, 3, 5), color = c("black", "black", "red"), style = c("classic", "modern", "modern"), stringsAsFactors = F)

lm_predictions = predict(object=price.all.lm, newdata=new_ships)

lm_predictions

# 8
logit_predictions = predict(object=price.all.blr, newdata=new_ships)

log_predictions = 1 / (1 + exp(-logit_predictions))

log_predictions