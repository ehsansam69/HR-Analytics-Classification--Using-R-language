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
53,50,45,44,10
df2 <-df2[,-6]
##Simple Logistic regression 
glm_fit = glm(age~is_promoted, data = df2)
summary(glm_fit)

# Logistic regression 

glm_fit = glm(is_promoted~., data = df2)
summary(glm_fit)

#probability of predicted values
glm_prob = predict(glm_fit, type="response")
glm_prob[1:10]

glm_pred = rep("no", 54808)
#where the probability is higher or equal to 50%. the values is yes
glm_pred[glm_prob>=0.50] = "yes"


