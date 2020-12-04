# В датасет записаны доли местоимений первого и второго лиц в 69 подкорпусах
# British National Corpus (the BYU-BNC). Посчитайте коэфициент корреляции
# Пирсона между переменными

library(tidyverse)

x <- read_csv('https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/bnc_pron.csv')

cor(x$P1, x$P2)
