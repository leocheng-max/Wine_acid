# upload data from the r_project

# 1. load dataset

wine_data <- "WineQT.csv"
wine <- read.csv(wine_data)

# remove variable named "id" in the data
wine_analysis <- wine[,-ncol(wine)]

# 檢查整個資料集是否有任何缺失值（回傳 TRUE/FALSE）
any(is.na(wine_analysis))

# 介紹變數性質

# fixed.acidity: 主要指的是葡萄酒中不易揮發的有機酸（如酒石酸 Tartaric acid、蘋果酸 Malic acid 等），
# 單位: g/L{克／公升})。

# volatile.acidity: 它代表的是葡萄酒中可以隨水分蒸發、具有揮發性的有機酸總量。
# 單位: g/L{克／公升})。

# citric.acid: 葡萄酒中天然存在的有機酸之一
# 單位: g/L{克／公升})。

# residual.sugar: 這個變數代表的是葡萄汁發酵結束並轉化為葡萄酒後,最後「留下來、沒有被酵母菌吃掉」的天然糖分
# 單位: g/L{克／公升})。

# chlorides: 它代表的是葡萄酒中含鹽量（Saltiness）的指標，主要的化學成分是氯化鈉
# 單位: g/L{克／公升})。

# free.sular.dioxide: 游離二氧化硫的「總和」,這是釀酒師維持紅酒壽命與品質的 「終極防腐與抗氧化劑」
# 單位: mg/L (毫克／公升)

# total.sulfur.dioxide: 它是葡萄酒中所有形式二氧化硫的「總和」。
# 單位: mg/L (毫克／公升)

# density:  g/mL（克／毫升）

# pH:  酸鹼值
# 單位: -\log_{10}[\text{H}^+]

# sulphates: 它通常是釀酒師在葡萄發酵前或發酵過程中，手動添加的一種葡萄酒添加劑。
# 單位: (g/L)

# alcohol: 體積百分濃度（% 或 Vol）

# quality: 評分的標準 1~10


# 遇到的問題:
#    (1) 單位不一致 有 ( %, g/L, g/cm^3)
#    (2) (pH,fixed.acidity)(fixed.acidity,citric.acidity) 在 相關係數 r 高度負相關
#    (3) 變數的數量多,每個都做相關性會很沒有效率
#    (4) 將quality變成>=5為good,<5為bad 的分類


str(wine_analysis)
table(wine_analysis$quality)
