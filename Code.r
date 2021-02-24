
df <- read.csv("C:/Users/Amit R Kulkarni/Desktop/Fetal_health.csv")

head(df))

library(corrplot)
library(stats)

M <- cor(df)


corrplot(M,method = "color", tl.cex = 0.50, tl.col = 'black',
         order = "hclust", diag = FALSE)

library(dplyr)

df1 <- data.frame(df$abnormal_short_term_variability,
                  df$percentage_of_time_with_abnormal_long_term_variability,
                  df$accelerations,
                  df$prolongued_decelerations
                  ) 

df1 <- as.data.frame(lapply(df1[1:4],scale))

fetal_health <- c(df$fetal_health)

df1$fetal_health <- fetal_health

fetal_train <- df1[1:70,1:4]

fetal_test <- df1[71:100,1:4]

fetal_train_labels <- df1[1:70,5]

fetal_test_labels <- df1[71:100,5]

library(class)

fetal_test_pred <- knn(train = fetal_train,test = fetal_test,cl = fetal_train_labels,k=3)

library(gmodels)

CrossTable(x = fetal_test_labels, y = fetal_test_pred,prop.chisq = FALSE)




