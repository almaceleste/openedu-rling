# Скачайте датасет, построенный на основании базы данных PHOIBLE (Moran et al.
# 2014) и постройте логистическую регрессию, предсказывающую наличие в языке
# абруптивных (переменная have_ejectives), на основании
# - количества согласных (переменная total) (МОДЕЛЬ 1)
# - количества согласных (переменная total) и части света (переменная area)
#   (МОДЕЛЬ 2)
# В ответе приведите AIC лучшей модели.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/phoible_ejectives.csv

# 539.7573

library(tidyverse)

ejectives <- read_csv('datasets/phoible_ejectives.csv')

model1 <-
    glm(
        data = ejectives,
        formula = ejectives$have_ejectives ~ ejectives$total,
        family = 'binomial'
    )

model2 <-
    glm(
        data = ejectives,
        formula = ejectives$have_ejectives ~ ejectives$total + ejectives$area,
        family = 'binomial'
    )

result <- AIC(model1, model2)
min(result$AIC)
