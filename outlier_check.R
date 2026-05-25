
# 檢查 outlier (fixed.acidity)
boxplot(wine_analysis$fixed.acidity, 
        main = "fixed.acid Distribution", 
        ylab = "fixed.acid(g/L)", 
        col = "lightblue")

# 檢查 outlier(volatile.acidity)
boxplot(wine_analysis$volatile.acidity, 
        main = "volatile.acidity Distribution", 
        ylab = "volatile.acidity (g/L)", 
        col = "lightblue")

# 檢查 outlier (citric.acid)
boxplot(wine_analysis$citric.acid, 
        main = "citric.acid Distribution", 
        ylab = "citric.acid (g/L)", 
        col = "lightblue")

# 檢查 outlier (residual.sugar)
boxplot(wine_analysis$residual.sugar, 
        main = "residual.sugar Distribution", 
        ylab = "residual.sugar(g/L)", 
        col = "lightblue")

# 檢查 outlier (chlorides)
boxplot(wine_analysis$chlorides, 
        main = "chlorides Distribution", 
        ylab = "chlorides (g/L)", 
        col = "lightblue")

# 檢查 outlier (free.sulfur.dioxide)
boxplot(wine_analysis$free.sulfur.dioxide, 
        main = "free.sulfur.dioxide Distribution", 
        ylab = "free.sulfur.dioxide (mg/L)", 
        col = "lightblue")

# 檢查 outlier (total.sulfur.dioxide)
boxplot(wine_analysis$total.sulfur.dioxide, 
        main = "total.sulfur.dioxide Distribution", 
        ylab = "total.sulfur.dioxide (mg/L)", 
        col = "lightblue")

# 檢查 outlier (density)
boxplot(wine_analysis$density, 
        main = "density Distribution", 
        ylab = "density (g/ml)", 
        col = "lightblue")

# 檢查 outlier (pH)
boxplot(wine_analysis$pH, 
        main = "pH Distribution", 
        ylab = "pH (-\log_{10}[{H}^+])", 
        col = "lightblue")

# 檢查 outlier (sulphates)
boxplot(wine_analysis$sulphates, 
        main = "sulphates Distribution", 
        ylab = "sulphates (g/L)", 
        col = "lightblue")

# 檢查 outlier (alcohol)
boxplot(wine_analysis$alcohol, 
        main = "Alcohol Distribution", 
        ylab = "Alcohol (%)", 
        col = "lightblue")

# 檢查 outlier (quality)
boxplot(wine_analysis$quality, 
        main = "quality Distribution", 
        ylab = "quality ", 
        col = "lightblue")
