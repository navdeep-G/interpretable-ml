library(caret)
library(rpart.plot)

dt_surrogate_caret <- function(data_path, ignore_cols, target, plot_title, output_file_name) {
  data = read.csv(data_path)
  data_train = data[!colnames(data) %in% ignore_cols]
  
  # Set seed to ensure reproducibility between runs
  set.seed(12345)
  
  
  # Set up caret to perform 5-fold cross validation
  caret.control <- trainControl(method = "repeatedcv",
                                number = 5,
                                repeats = 1)
  
  
  # Use caret to train the rpart decision tree using 5-fold cross 
  # validation and use 15 values for tuning the cp parameter for rpart. 
  # This code returns the best model trained
  rpart.cv <- train(as.formula(paste0(target, "~ .")), 
                    data = data_train,
                    method = "rpart",
                    trControl = caret.control,
                    tuneLength = 15)
  
  
  # Display the results of the cross validation run
  cat("Model Summary")
  print(rpart.cv)
  
  cat("\nAccuracy and Kappa Across CV Folds")
  print(rpart.cv$resample)
  
  # What is the standard deviation?
  cat(paste("\nCross validation standard deviation:",  
            sd(rpart.cv$resample$Accuracy), "\n", sep = " "))
  
  
  # Pull out the the trained model using the best parameters on
  # all the data
  rpart.best <- rpart.cv$finalModel
  rpart.best
  
  # Export tree image
  png(paste0(output_file_name), width = 800, height = 600)
  rpart.plot(rpart.best, main = plot_title)
  dev.off()
}

ignore_cols=c("target", "prob_target_class0", "prob_target_class1", "prob_target_class2")
dt_surrogate_caret("simulated/multinomial/output/simulated_mult_preds.csv", ignore_cols, "pred_target", "Simulated Data Decision Tree Surrogate", "simulated/multinomial/images/dt_surrogate_caret_simulated.png")
ignore_cols=c("PAY_0","prob_PAY_0_class0", "prob_PAY_0_class1", "prob_PAY_0_class2", "prob_PAY_0_class3", "prob_PAY_0_class4", "prob_PAY_0_class5", "prob_PAY_0_class6", "prob_PAY_0_class7"
              ,"prob_PAY_0_class8" )
dt_surrogate_caret("credit/multinomial/output/credit_mult_preds.csv", ignore_cols, "pred_PAY_0", "Credit Card Data Decision Tree Surrogate", "credit/multinomial/images/dt_surrogate_caret_credit.png")
