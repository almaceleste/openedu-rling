# Скачайте датасет, построенный на основании базы данных PHOIBLE (Moran et al.
# 2014) и постройте логистическую регрессию, предсказывающую наличие в языке
# абруптивных (переменная have_ejectives), на основании
# - количества согласных (переменная total) (МОДЕЛЬ 1)
# - количества согласных (переменная total) и части света (переменная area)
#   (МОДЕЛЬ 2)
# Используя первую модель (из предыдущего задания), предскажите вероятность
# иметь абруптивные, если в языке 40 согласных.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/phoible_ejectives.csv

library(tidyverse)

ejectives <- read_csv('datasets/phoible_ejectives.csv')

model1 <-
    glm(
        data = ejectives,
        formula = have_ejectives ~ total,
        family = 'binomial'
    )

model2 <-
    glm(
        data = ejectives,
        formula = have_ejectives ~ total + area,
        family = 'binomial'
    )

result <- AIC(model1, model2)
# rownames(result[result$AIC == min(result$AIC), ])
# modelname <- rownames(filter(result, result$AIC == min(result$AIC)))
# get(modelname)

predict(
    model1, type = 'response', 
    newdata = data.frame(total = c(40))
)
