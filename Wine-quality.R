# upload data from the r_project

# 1. load dataset

wine_data <- "WineQT.csv"
wine <- read.csv(wine_data)

summary(wine)

# remove variable named "id" in the data
wine_analysis <- wine[,-ncol(wine)]

# fixed.acidity: 主要指的是葡萄酒中不易揮發的有機酸（如酒石酸 Tartaric acid、蘋果酸 Malic acid 等），
# 它們是構成葡萄酒酸味骨架與清爽感的主要來源。

# volatile.acidity: 它代表的是葡萄酒中可以隨水分蒸發、具有揮發性的有機酸總量。
