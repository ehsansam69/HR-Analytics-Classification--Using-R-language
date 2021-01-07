df <- read.csv('train.csv',header = TRUE)
str(df)  #description of data frame 

#uni variate analysis
summary(df)


# suspicious for outlier or skewnes ; no_of_training  length_of_service 
# NA value in previous_year_rating

hist(df$length_of_service)
hist(df$no_of_trainings)
#categorical values
barplot(table(df$region))
barplot(table(df$department))
barplot(table(df$education))
barplot(table(df$recruitment_channel))

unique(df$previous_year_rating)

# we decided to fill NA values for previous_year_rating with 0 
which(is.na(df$previous_year_rating))
df$previous_year_rating[is.na(df$previous_year_rating)] <- 0

# get dummy variables for categorical columns with "dummies" package 
df2 <- dummy.data.frame(df)
##Simple Logistic regression 

glm_fit = glm(age~is_promoted, data = df, family = binomial)
summary(glm_fit)
