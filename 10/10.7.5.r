# В работе [Hammerly, Dillon 2017] исследовалась английское ошибочное
# согласование по лицу. В датасет собраны часть их данных со следующими
# переменными:
# Experiment — условия эксперимента
# Grammaticality — грамматичность предложения
# Attractor — согласовательный магнит
# question — стимульное предложение
# остальные столбцы с ответами носителей
# Нормализуйте оценки каждого спикера и посчитайте ICC для всех спикеров. В
# ответе приведите его значение (с точностью до 3 знаков после запятой).
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/Hammerly_Chris_data.csv

# 0.471

x <- readr::read_csv('./datasets/Hammerly_Chris_data.csv')
