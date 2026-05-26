

# >=6 設為1,<6設為0
wine_analysis$good_wine <- ifelse(wine$quality >= 6, 1, 0)

#  將目標變數轉換為 factor
wine_analysis$good_wine <- factor(wine_analysis$good_wine, levels = c(0, 1), labels = c("Bad", "Good"))

# 4. 移除原本的 quality 欄位，避免模型偷看答案
wine_analysis <- wine_analysis[, !names(wine) %in% c("quality")]

# 查看轉換後的類別分布
table(wine_analysis$good_wine)

summary(wine_analysis)
head(wine_analysis$good_wine)
