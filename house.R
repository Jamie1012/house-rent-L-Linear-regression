rent <- read.csv("/Users/apple/Library/Containers/com.microsoft.Excel/Data/Desktop/house-rent.csv")
summary(rent)
head(rent)
plot(rent)

#splitting the data into training and test data

set.seed(2)
library(caTools)
split <- sample.split(rent , SplitRatio = 0.7)
split
train <- subset(rent , split="TRUE")
test <- subset(rent , split="FALSE")
train
test

#create the model

Model <- lm(RentPrice ~.,data=train)
summary(Model)

#prediction
pred <- predict(Model , test)
pred

#comparing predicting vs actual values

plot(test$RentPrice,lty=1.8, col="red")
lines(pred,type="l", col="blue")

