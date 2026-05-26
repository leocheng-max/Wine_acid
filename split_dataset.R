
install.packages("caret", dependencies = TRUE)
library(caret)
set.seed(525)

# 分割訓練/測試集 (70/30) 
train_idx <- createDataPartition(wine_ready$good_wine, p = 0.7, list = FALSE)
train <- wine_ready[train_idx, ]
test  <- wine_ready[-train_idx, ]

# 顯示 train/test 大小
cat("Training set size:", nrow(train))
cat("Test set size:",    nrow(test), "\n")
cat("Training class distribution:\n")
table(train$good_wine)

# 檢查
head(train)
head(test)
