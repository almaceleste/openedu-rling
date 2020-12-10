# В датасет записаны доли местоимений первого и второго лиц в 69 подкорпусах
# British National Corpus (the BYU-BNC). Постройте две регрессионные модели,
# предсказывающие долю местоимений первого лица, на основании:
# (1) доли местоимений второго лица;
# (2) доли местоимений второго лица и регистра.
# Выберите при помощи критерия Акаике лучшую модель и приведите минимальный
# коэфициент полученной модели.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/bnc_pron.csv

library(tidyverse)

bnc <- read_csv('datasets/bnc_pron.csv')

rm1 <- lm(data = bnc, P1 ~ P2)
rm2 <- lm(data = bnc, P1 ~ P2 + Reg)

AIC(rm1, rm2)

# about negative AIC values
# https://stats.stackexchange.com/questions/84076/negative-values-for-aic-in-general-mixed-model
# https://stats.stackexchange.com/questions/486/negative-values-for-aicc-corrected-akaike-information-criterion

# wrong (bigger AIC)
summary(rm1)
# right (lesser AIC)
summary(rm2)
