# Используйте лучшую получившуюся модель из прошлого задания, чтобы предсказать количество местоимений первого лица в подкорпусе с регистром "Spok" и долей местоимений второго лица 0.5.

library(tidyverse)

bnc <- read_csv('datasets/bnc_pron.csv')

rm1 <- lm(data = bnc, P1 ~ P2)
rm2 <- lm(data = bnc, P1 ~ P2 + Reg)

# wrong (bigger AIC)
predict(rm1, newdata = data.frame(Reg = 'Spok', P2 = 0.5))
# right (lesser aic)
predict(rm2, newdata = data.frame(Reg = 'Spok', P2 = 0.5))
