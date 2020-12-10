# В работе [Chi-kuk 2007] исследовались речь 7 гомосексуальных и 7
# гетеросексуальных носителей кантонского диалекта языка юэ. В датасете
# следующие переменные: долгота s (s.duration.ms), долгота гласных
# (vowel.duration.ms), среднее значении ЧОТ (average.f0.Hz), диапозон ЧОТ
# (f0.range.Hz), сколько носителей воспринимает говорящего как гомосексуалa
# (perceived.as.homo), возраст говорящего (age). Используйте функцию step() с
# аргументом both, чтобы получить лучшую регрессию, предсказывающую переменную
# perceived.as.homo. Приведите скорректированный R-квадрат получившейся модели.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/orientation.csv

library(tidyverse)

sexuality <- read_csv('datasets/orientation.csv')

model1 <- lm(
    formula = perceived.as.homo ~ age + average.f0.Hz + f0.range.Hz +
        s.duration.ms + vowel.duration.ms,
    data = sexuality
)

step(model1, direction = 'both')

model2 <- lm(
    formula = perceived.as.homo ~ age + s.duration.ms + vowel.duration.ms,
    data = sexuality
)

summary(model2)
