

library(ggplot2)

# fixed.acidity
ggplot(wine_ready, aes(x = fixed.acidity, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "fixed.acidity", y = "good_wine")

# volatile.acidity
ggplot(wine_ready, aes(x = volatile.acidity, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "volatile.acidity", y = "good_wine")

# citric.acid
ggplot(wine_ready, aes(x = citric.acid, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "citric.acid", y = "good_wine")


# residual.sugar
ggplot(wine_ready, aes(x = residual.sugar, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "residual.sugar", y = "good_wine")


# chlorides
ggplot(wine_ready, aes(x = chlorides, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "chlorides", y = "good_wine")

# free.sulfur.dioxide
ggplot(wine_ready, aes(x = free.sulfur.dioxide, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "free.sulfur.dioxide", y = "good_wine")


# total.sulfur.dioxide
ggplot(wine_ready, aes(x = total.sulfur.dioxide, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "total.sulfur.dioxide", y = "good_wine")

# density
ggplot(wine_ready, aes(x = density, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "density", y = "good_wine")

# pH
ggplot(wine_ready, aes(x = pH, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "pH", y = "good_wine")

# sulphates
ggplot(wine_ready, aes(x = sulphates, y = good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "sulphates", y = "good_wine")



# alcohol
ggplot(wine_ready, aes(x = alcohol, y =good_wine)) +
  # fill = "white" 確保箱子是白的，color = "black" 繪製黑色線條
  geom_boxplot(fill = "white", color = "black", width = 0.5, outlier.shape = NA) + 
  
  # 課本通常會加上原始數據點，這裡用 alpha（透明度）和 grey 讓點點變低調，不搶主角光芒
  geom_jitter(color = "grey40", width = 0.1, alpha = 0.5, shape = 16) + 
  
  # 使用經典的 classic 主題（只有 X、Y 軸的黑色實線，完全沒有背景網格）
  theme_classic() + 
  
  # 調整字體大小與樣式，讓它更像課本印刷出的質感
  theme(
    text = element_text(family = "serif", size = 12), # 使用 Serif 字體（類似 Times New Roman）
    axis.line = element_line(color = "black", linewidth = 0.6), # 加粗座標軸線
    axis.text = element_text(color = "black") # 確保坐標軸文字是純黑
  ) +
  
  # 加上標準的課本標籤
  labs(x = "alcohol", y = "good_wine")
