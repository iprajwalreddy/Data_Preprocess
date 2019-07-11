#To remove all the previous data
rm(list = ls())

#Importing the data
dataset = read.csv('Data.csv')

#Taking care of missing data
?ifelse()
?ave()
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm =TRUE)),
                        dataset$Salary)

#Encoding the categorical data
dataset$Country = factor(dataset$Country, levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased, levels = c('No','Yes'),
                           labels = c(0,1))

#Splitting the data into train and test models
install.packages('caTools')
library(caTools)
?set.seed()
set.seed(123)
split = sample.split(dataset,SplitRatio = 0.8)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)

#Feature Scaling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
