
# 1. 拆分資料：只把 X 特徵拿出來做標準化，排除第 12 欄的 good_wine
X_scaled <- scale(wine_analysis[, -12])

# 🌟 2. 關鍵修正：因為 scale() 會把資料變成 matrix，我們要立刻將它轉回 data.frame
X_scaled <- as.data.frame(X_scaled)

# 3. 把完全沒被破壞、維持原樣的 quality (Y) 加回去
wine_ready <- X_scaled
wine_ready$good_wine <- wine_analysis$good_wine

str(wine_ready)
