library(rpart)
library(rpart.plot)
library(e1071)
library(caret)
library(ggplot2)
library(scales)

dt_surrogate <- function(data_path, ignore_cols, target, plot_title, output_file_name) {
  
  #Helper function(s)
  ggplot_confusion_matrix <- function(m){
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
  data = read.csv(data_path)
  data_train = data[!colnames(data) %in% ignore_cols]
  
  #Construct rpart tree
  tree_data <- rpart(as.formula(paste0(target, "~ .")), data = data_train, method = "class")
  
  #Plot rpart tree
  rpart.plot(tree_data, main = plot_title)
  
  #Check for important variables
  tree_data$variable.importance
  
  #Predict
  predict <- as.data.frame(predict(tree_data, data_train))
  predicted_class <- as.data.frame(colnames(predict)[max.col(predict,ties.method="first")])
  colnames(predicted_class) <- c("pred_rpart")
  
  #Check performance
  print("RPart Performance Metrics:")
  printcp(tree_data) # display the results 
  plotcp(tree_data) # visualize cross-validation results 
  summary(tree_data) # detailed summary of splits
  
  print("RPart Confusion Matrix")
  cfm <- confusionMatrix(predicted_class$pred_rpart, data_train[,target])
  cfm
  
  #ggplot version of confusion matrix
  ggplot_confusion_matrix(cfm)
  
  #Export tree image
  png(paste0("./images/", output_file_name), width = 800, height = 600)
  rpart.plot(tree_data, main = plot_title)
  dev.off()
  
}

ignore_cols=c("target", "prob_target_class0", "prob_target_class1", "prob_target_class2" )
dt_surrogate("./output/simulated_mult_preds.csv", ignore_cols, "pred_target", "Simulated Data Decision Tree Surrogate", "dt_surrogate_simulated.png")
ignore_cols=c("PAY_0","prob_PAY_0_class0", "prob_PAY_0_class1", "prob_PAY_0_class2", "prob_PAY_0_class3", "prob_PAY_0_class4", "prob_PAY_0_class5", "prob_PAY_0_class6", "prob_PAY_0_class7"
,"prob_PAY_0_class8" )
dt_surrogate("./output/credit_mult_preds.csv", ignore_cols, "pred_PAY_0", "Credit Card Data Decision Tree Surrogate", "dt_surrogate_credit.png")
