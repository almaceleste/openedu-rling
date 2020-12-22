# В работе [Hammerly, Dillon 2017] исследовалась английское ошибочное
# согласование по лицу. В датасет собраны часть их данных со следующими
# переменными:
# Experiment — условия эксперимента
# Grammaticality — грамматичность предложения
# Attractor — согласовательный магнит
# question — стимульное предложение
# остальные столбцы с ответами носителей
# Скачайте датасет и укажите, ответы какой пары носителей лучше всего
# скоррелированы (используйте корреляцию Кендала).
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/Hammerly_Chris_data.csv

# 1501088630 1501077779

x <- readr::read_csv('./datasets/Hammerly_Chris_data.csv')

cor(x[, 6:10], method = 'kendal')
