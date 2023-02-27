pirates = get(load("pirates.RData"))

# 1)
pixar_anova = aov(formula = tattoos ~ fav.pixar, data = pirates)

summary(pixar_anova)

# there is no significant effect because fav.pixar does not have a statistically signifigant p-value

# 2)
fav_pirate_anova = aov(formula = tattoos ~ favorite.pirate, data = pirates)

summary(fav_pirate_anova)

# there is no significant effect because favorite.pirate does not have a statistically signifigant p-value

# 3)
both_anova = aov(formula = tattoos ~ favorite.pirate + fav.pixar, data = pirates)

summary(both_anova)

# no; the conclusions do not differ when i include both variables

# 4)
both_interaction_anova = aov(formula = tattoos ~ favorite.pirate * fav.pixar, data = pirates)

summary(both_interaction_anova)

# the interaction term has a p-value of 0.630, which means that there is no statistically signifigant interaction between favorite.pirate and fav.pixar