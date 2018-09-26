library(rpart)
library(rpart.plot)
library(e1071)
library(caret)
library(ggplot2)
library(scales)

#Helper function(s)
ggplotConfusionMatrix <- function(m){
  mytitle <- paste("Accuracy", percent_format()(m$overall[1]),
                   "Kappa", percent_format()(m$overall[2]))
  p <-
    ggplot(data = as.data.frame(m$table) ,
           aes(x = Reference, y = Prediction)) +
    geom_tile(aes(fill = log(Freq)), colour = "white") +
    scale_fill_gradient(low = "white", high = "steelblue") +
    geom_text(aes(x = Reference, y = Prediction, label = Freq)) +
    theme(legend.position = "none") +
    ggtitle(mytitle)
  return(p)
}

#Setup dataset for rpart
credit = read.csv("./output/credit_mult_preds.csv")
credit_train = credit[!colnames(credit) %in% c("prob_PAY_0_class0","prob_PAY_0_class1","prob_PAY_0_class2","prob_PAY_0_class3",
                             "prob_PAY_0_class4","prob_PAY_0_class5","prob_PAY_0_class6","prob_PAY_0_class7",
                             "prob_PAY_0_class8", "PAY_0")]

#Construct rpart tree
tree_credit <- rpart(pred_PAY_0 ~ ., data = credit_train, method = "class")

#Plot rpart tree
rpart.plot(tree_credit, main = "Credit Decision Tree Surrogate Model")

#Check for important variables
tree_credit$variable.importance

#Predict
predict <- as.data.frame(predict(tree_credit, credit_train))
predicted_class <- as.data.frame(colnames(predict)[max.col(predict,ties.method="first")])
colnames(predicted_class) <- c("pred_PAY_0_rpart")

#Check performance
printcp(tree_credit) # display the results 
plotcp(tree_credit) # visualize cross-validation results 
summary(tree_credit) # detailed summary of splits

cfm <- confusionMatrix(predicted_class$pred_PAY_0_rpart, credit_train$pred_PAY_0)
cfm

#ggplot version of confusion matrix
ggplotConfusionMatrix(cfm)

#Export tree image
png("./images/dt_surrogate_credit.png", width = 800, height = 600)
rpart.plot(tree_credit, main = "Credit Decision Tree Surrogate Model")
dev.off()