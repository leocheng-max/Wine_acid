library(GGally)
library(ggplot2)

# 2. 精選 4 個最核心的變數，這樣格子大小最適中，字體最清晰
core_vars <- c("fixed.acidity", "volatile.acidity","citric.acid","pH" )

# 3. 繪製中央十字佈局的兩兩關係圖
ggpairs(
  data = wine_analysis[, core_vars],
  
  # 🌟 關鍵設定：讓中間對角線只顯示變數名稱（不畫圖，空出乾淨的十字軸）
  diag = list(continuous = wrap("blank")), 
  
  # 下三角（左下角）：繪製帶有透明度的兩兩散佈圖 (Scatter Plot)
  lower = list(continuous = wrap("points", alpha = 0.5, color = "#4682B4", size = 1)),
  
  # 上三角（右上角）：繪製兩兩的相關係數數值 (Correlation)
  upper = list(continuous = wrap("cor", size = 5, color = "darkred")),
  
  # 強制將變數名稱的標籤顯示在中間對角線的格子內
  axisLabels = "internal" 
) +
  # 套用經典白色主題，並加入標題
  theme_bw() +
  labs(title = "WineQT: Matrix Pairs Plot (Center Axis Labels)") +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    strip.background = element_blank(), # 移除外圍重複的標籤外框
    strip.text = element_blank()        # 隱藏外圍標籤，讓焦點完全集中在中央十字
  )
