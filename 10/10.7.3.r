# В работе [Hammerly, Dillon 2017] исследовалась английское ошибочное
# согласование по лицу. В датасет собраны часть их данных со следующими
# переменными:
# Experiment — условия эксперимента
# Grammaticality — грамматичность предложения
# Attractor — согласовательный магнит
# question — стимульное предложение
# остальные столбцы с ответами носителей
# Посчитайте ICC для всех спикеров и приведите в ответе его значение.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/Hammerly_Chris_data.csv

# 0.318

x <- readr::read_csv('./datasets/Hammerly_Chris_data.csv')

irr::icc(x[, 6:10])
