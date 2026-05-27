
#install.packages("e1071")
#install.packages("caret") # 用於輸出混淆矩陣與評估指標

library(e1071)
library(caret)

# =====================================================================
# 步驟一：資料分割 (70% 訓練集、30% 測試集)
# =====================================================================
# 分割訓練/測試集 (70/30) 
train_idx <- createDataPartition(wine_ready$good_wine, p = 0.7, list = FALSE)
train <- wine_ready[train_idx, ]
test  <- wine_ready[-train_idx, ]

# 顯示 train/test 大小
cat("Training set size:", nrow(train))
cat("Test set size:",    nrow(test), "\n")
cat("Training class distribution:\n")
table(train$good_wine)



# =====================================================================
# 步驟二：建立線性 SVM 模型
# =====================================================================
# 關鍵點 1：kernel = "linear" -> 指定線性核，不進行高維度非線性投影
svm_linear <- svm(good_wine ~ ., 
                  data = train, 
                  kernel = "linear", 
                  scale = TRUE, 
                  probability = TRUE) # 允許預測機率

# 查看模型摘要（線性模型最關心支持向量個數是否適中）
summary(svm_linear)


# =====================================================================
# 步驟三：超參數調校 (Tuning Cost) ★ 線性模型只需要調 C
# =====================================================================
# 線性 SVM 只有一個核心參數叫 cost (C)，用來控制「對錯誤分類的容忍度」：
# - cost 太大：容忍度低，馬路變窄，容易記住訓練集雜訊（過擬合）。
# - cost 太小：容忍度高，馬路變寬，模型更穩健（泛化能力好）。

cat("\n--- 開始自動尋找最佳 Cost 參數 ---\n")
tuned_linear <- tune(svm, good_wine ~ ., data = train, 
                     kernel = "linear",
                     ranges = list(cost = c(0.001, 0.01, 0.1, 1, 10, 100)))

print(tuned_linear)
best_linear_model <- tuned_linear$best.model # 提取最佳模型


# =====================================================================
# 額外步驟：計算線性 SVM 的變數重要性 (Weights)
# =====================================================================

# 1. 提取線性 SVM 的權重 (W = t(weights) %*% support_vectors)
#    這是線性核特有的數學性質，可以直接算出每個變數的係數
w <- t(best_linear_model$coefs) %*% best_linear_model$SV

# 2. 將權重轉成乾淨的資料表格，並計算絕對值（因為負得越多也代表越關鍵）
importance_df <- data.frame(
  Variable = colnames(w),
  Weight = as.vector(w),
  Absolute_Weight = abs(as.vector(w))
)

# 3. 依照絕對值大小，由大到小排序
importance_df <- importance_df[order(-importance_df$Absolute_Weight), ]

# 4. 印出前兩名最關鍵的變數
cat("--- 線性 SVM 變數重要性排行 ---\n")
print(importance_df)

cat("\n💡 結論：最關鍵的兩個變數是「", as.character(importance_df$Variable[1]), 
    "」與「", as.character(importance_df$Variable[2]), "」！\n")

# =====================================================================
# 步驟四：測試集預測與性能評估
# =====================================================================
# 1. 預測分類類別
pred_class <- predict(best_linear_model, newdata = test)

# 2. 輸出完整評估報告（包含 Accuracy, Sensitivity, Specificity）
cat("\n--- 測試集線性 SVM 評估結果 ---\n")
confusionMatrix(pred_class, test$good_wine)


# =====================================================================
# 步驟五：繪製二維線性分類邊界線
# =====================================================================
# 只有在自變數為 2 個時可以畫圖，你會看到一條完美的「直線馬路」將兩類切開
plot(best_linear_model, train, sulphates ~ alcohol)
