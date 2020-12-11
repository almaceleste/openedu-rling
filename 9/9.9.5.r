# Скачайте датасет, построенный на основании базы данных PHOIBLE (Moran et al.
# 2014) и постройте логистическую регрессию, предсказывающую наличие в языке
# долгих гласных (переменная have_long), на основании
# - количества гласных (переменная total) (МОДЕЛЬ 1)
# - количества гласных (переменная total) и части света (переменная area)
#   (МОДЕЛЬ 2)
# Используя первую модель из предыдущего задания, предскажите вероятность
# иметь долгие гласные, если в языке 15 гласных.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/phoible_long_vowels.csv

library(tidyverse)

vowels <- read_csv('datasets/phoible_long_vowels.csv')

model1 <- glm(
    data = vowels,
    formula = have_long ~ total,
    family = 'binomial'
)

model2 <- glm(
    data = vowels,
    formula = have_long ~ total + area,
    family = 'binomial'
)

predict(
    model1,
    type = 'response',
    newdata = data.frame(total = 15)
)
