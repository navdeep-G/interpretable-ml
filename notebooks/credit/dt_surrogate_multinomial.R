library(rpart)
library(rpart.plot)
library(visNetwork)

credit = read.csv("./output/credit_mult_preds.csv")
credit = credit[!colnames(credit) %in% c("prob_PAY_0_class0","prob_PAY_0_class1","prob_PAY_0_class2","prob_PAY_0_class3",
                             "prob_PAY_0_class4","prob_PAY_0_class5","prob_PAY_0_class6","prob_PAY_0_class7",
                             "prob_PAY_0_class8", "PAY_0")]
tree_credit <- rpart(pred_PAY_0 ~ ., data = credit, method = "class")

#Class rpart image
png("./images/dt_surrogate_credit.png", width = 800, height = 600)
rpart.plot(tree_credit, main = "Credit Decision Tree Surrogate Model")
dev.off()