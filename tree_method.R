# ======================================================
#  Wine Quality Prediction – Classification Tree
#  Goal: Predict high-quality wine
#  Method: Decision Tree (rpart)
#  Includes: Pruning, plotting, evaluation
# ======================================================

# ── 0. 安裝與載入套件（已移除 ggplot2） ──────────────────
packages <- c("rpart", "rpart.plot", "caret", "pROC")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

set.seed(525)

# ── 3. 建立初始分類樹（未剪枝）─────────────────────
tree_full <- rpart(good_wine ~ .,
                   data = train,
                   method = "class", # 告訴rpart 這是"分類問題"
                   control = rpart.control(cp        = 0,
                                           minsplit  = 20,
                                           minbucket = 7))
# ── 4. 交叉驗證選擇最佳 cp 值（剪枝）──────────────
plotcp(tree_full)

best_cp <- tree_full$cptable[which.min(tree_full$cptable[, "xerror"]), "CP"]
cat("\nBest cp (complexity parameter) =", best_cp, "\n")

tree_pruned <- prune(tree_full, cp = best_cp)

# ── 5. 繪製分類樹（改良版，僅輸出此圖）────────────────
png("classification_tree_clean.png",
    width = 2600, height = 1800, res = 200, bg = "#FAFAFA")

par(mar = c(4, 1, 5, 1), bg = "#FAFAFA")

rpart.plot(
  tree_pruned,
  # 版面
  type          = 4,          # 分裂條件顯示在分支線上
  extra         = 104,        # 類別 + 各類比例 + 樣本佔比
  fallen.leaves = TRUE,       # 葉節點對齊同一層
  compress      = TRUE,       # 壓縮版面，樹形更對稱
  ycompress     = TRUE,       # 垂直方向也壓縮
  round         = 1,          # 節點小圓角
  # 顏色（深藍 vs 淡綠，對比明確）
  box.palette   = list("1" = "#1A6FA8",   # 深藍 = High quality
                       "0" = "#D4EDDA"),  # 淡綠 = Low quality
  shadow.col    = "gray75",
  border.col    = "gray60",
  # 文字
  cex           = 0.85,
  tweak         = 1.15,
  split.cex     = 1.0,
  split.font    = 2,
  split.col     = "gray25",
  # 關掉節點編號
  nn            = FALSE,
  main          = ""
)

title(
  main     = "  Tree method  ",
  sub      = paste0("Pruned tree  |  cp = ", round(best_cp, 5),
                    "   |   Blue = High Quality   |   Light Green = Low Quality",
                    "   |   Training n = ", nrow(train)),
  cex.main = 1.3,  font.main = 2, col.main = "#1A1A2E",
  cex.sub  = 0.82,             col.sub  = "gray45",
  line     = 3
)

dev.off()
cat("✅ 分類樹已存為 classification_tree_clean.png\n")

# ── 6. 預測測試集 ──────────────────────────────────
pred_class <- predict(tree_pruned, newdata = test, type = "class")
# pred_prob  <- predict(tree_pruned, newdata = test, type = "prob")[, "Good"]

pred_class <- factor(pred_class, levels = c("Bad", "Good"))
test$good_wine <- factor(test$good_wine, levels = c("Bad", "Good"))

confusionMatrix(data = pred_class,          # 預測值放這裡
                reference = test$good_wine, # 實際值放這裡
                positive = "Good")



# ── 7. 評估模型（保留文字數據供報告參考）──────────────

# 1. 建立最原始的混淆矩陣對撞表
conf_matrix <- table(Prediction = pred_class, Reference = test$good_wine)
conf_matrix

# 2. 提取九宮格中的四個核心數字
#（注意：R 預設會依字母排序，"Bad" 在前為第一列/欄，"Good" 在後為第二列/欄）
TN <- conf_matrix["Bad", "Bad"]   # 實際爛酒，猜爛酒
FN <- conf_matrix["Bad", "Good"]  # 實際好酒，猜爛酒（漏抓）
FP <- conf_matrix["Good", "Bad"]  # 實際爛酒，猜好酒（抓錯）
TP <- conf_matrix["Good", "Good"] # 實際好酒，猜好酒

# 3. 手動計算四大核心統計指標
accuracy    <- (TP + TN) / sum(conf_matrix)
sensitivity <- TP / (TP + FN)  # 真正好酒中，抓出多少
specificity <- TN / (TN + FP)  # 真正爛酒中，過濾多少
precision   <- TP / (TP + FP)  # 猜是好酒中，猜對多少

# 4. 漂亮地印出結果
cat("--- 決策樹模型最終評估報告 ---\n")
cat("準確率 (Accuracy)   :", round(accuracy, 4), "\n")
cat("敏感度 (Sensitivity):", round(sensitivity, 4), "\n")
cat("特異度 (Specificity):", round(specificity, 4), "\n")
cat("精準率 (Precision)  :", round(precision, 4), "\n")

# ── 8. 結論 ───────────────────────────────────────
cat("\n========== Conclusions ==========\n")
cat("The classification tree uses simple if-then rules to predict high-quality wine.\n")
cat("The most important predictors are alcohol and volatile acidity.\n")
cat("Performance will be compared to ensemble methods (e.g. Random Forest).\n")

cat("\n輸出檔案：\n")
cat("  classification_tree_clean.png  （分類樹高解析度圖片）\n")