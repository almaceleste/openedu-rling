# Скачайте датасет из работы (Nettle 1998). Визуализируйте модель,
# предсказывающую переменную Population по переменной Langs. Какое из основных
# предположений на применение линейной регрессии нарушено?
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/language_diversity.csv

library(tidyverse)

diversity <- read_tsv('./8/language_diversity.csv')

model <- lm(data = diversity, Population ~ Langs)

diversity %>%
    ggplot(aes(Population, Langs)) +
    geom_point() +
    geom_smooth(method = 'lm')

# гомоскедастичность