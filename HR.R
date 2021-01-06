df <- read.csv('train.csv',header = TRUE)
str(df)  #description of data frame 

#uni variate analysis
summary(df)


# suspicious for outlier or skewness ; no_of_trainings  length_of_service  

hist(df$length_of_service)
hist(df$no_of_trainings)

barplot(table(df$region))
