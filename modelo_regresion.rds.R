
library(caret)
library(ggplot2)


url2<- "https://raw.githubusercontent.com/bonifacioyeuri/shiny/main/ciclocombinado.csv"
ccombinado <- read.csv(url2)

predictores <- ccombinado[,c("ccombinado$Año")]
objetivo <- ccombinado$TE

train_control <- trainControl(method = "cv", number=10)

modelo <- train(predictores, objetivo, method="lm", trControl=train_control)

saveRDS(modelo, file = "modelo_regresion.rds")

