install.packages("ggplot2")   # run only once
install.packages("dplyr")

library(ggplot2)
library(dplyr)

titanic <- read.csv("C:/Users/ishap/Downloads/titanic.csv",
                    stringsAsFactors = FALSE)

head(titanic)
str(titanic)
summary(titanic)
names(titanic)


dim(titanic)
colSums(is.na(titanic))

# Fill missing Age
titanic$Age[is.na(titanic$Age)] <- median(titanic$Age, na.rm = TRUE)

# Fill Embarked
mode_embarked <- names(sort(table(titanic$Embarked), decreasing = TRUE))[1]
titanic$Embarked[is.na(titanic$Embarked)] <- mode_embarked

# Drop Cabin
titanic$Cabin <- NULL

# Convert to factor
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)


titanic_clean <- na.omit(titanic)


table(titanic_clean$Survived)
table(titanic_clean$Sex, titanic_clean$Survived)
table(titanic_clean$Pclass, titanic_clean$Survived)


graphics.off()

dev.new()
barplot(table(titanic_clean$Survived),
        col = c("red","green"),
        main = "Survival Count")

dev.new()
barplot(table(titanic_clean$Sex, titanic_clean$Survived),
        beside = TRUE,
        col = c("pink","lightblue"),
        main = "Gender vs Survival")

dev.new()
hist(titanic_clean$Age,
     col = "skyblue",
     main = "Age Distribution")

dev.new()
barplot(table(titanic_clean$Pclass, titanic_clean$Survived),
        beside = TRUE,
        col = c("orange","green"),
        main = "Class vs Survival")



p1 <- ggplot(titanic_clean, aes(x = Survived)) +
  geom_bar(fill = "blue") +
  labs(title = "Survival Count")
print(p1)

p2 <- ggplot(titanic_clean, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5, position = "dodge")
print(p2)

p3 <- ggplot(titanic_clean, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "dodge")
print(p3)


titanic_clean$FamilySize <- titanic_clean$SibSp + titanic_clean$Parch + 1

titanic_clean$AgeGroup <- cut(titanic_clean$Age,
                             breaks = c(0,12,18,35,60,100),
                             labels = c("Child","Teen","Adult","Middle","Senior"))


numeric_data <- titanic_clean[sapply(titanic_clean, is.numeric)]
cor(numeric_data)

model <- glm(Survived ~ Pclass + Sex + Age + Fare,
             data = titanic_clean,
             family = "binomial")

summary(model)


titanic_clean$Predicted_Prob <- predict(model, type = "response")

titanic_clean$Predicted <- ifelse(titanic_clean$Predicted_Prob > 0.5, 1, 0)

titanic_clean$Predicted <- as.factor(titanic_clean$Predicted)


table(Predicted = titanic_clean$Predicted,
      Actual = titanic_clean$Survived)

mean(titanic_clean$Predicted == titanic_clean$Survived)

write.csv(titanic_clean, "cleaned_titanic.csv", row.names = FALSE)


