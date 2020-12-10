# В работе [Hatano, Kitamura, Takemoto, Mokhtari, Honda, Masaki 2012]
# исследовалась длина голосового тракта при произнесении разных гласных
# (переменные a.vtl, i.vtl…). В исследовании приняли участие 15 носителей
# японского языка. В датасет записаны их рост (body.height) и возраст (age).
# Напишите скрипт, который максимаально точно воспроизводит график и приложите
# его и свой код в качестве решения.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/data.japanese.vocal.tract.length.csv

library(tidyverse)

x <- read_csv('datasets/data.japanese.vocal.tract.length.csv')

x %>%
    # сокращаем имена столбцов для более удобного отображения на графике
    mutate(a = a.vtl, e = e.vtl, i = i.vtl, o = o.vtl, u = u.vtl) %>%
    # собираем данные, предназначенные для отображения:
    # vowel - названия гласных, length - соответствующая длина голосового тракта
    gather(key = vowel, value = length, a:u) %>%
    # данные для графика: x - названия гласных, y - длина голосового тракта,
    ggplot(aes(x = vowel, y = length)) +
    # рисуем боксы, соответсвующие гласным
    geom_boxplot() +
    # наносим линию, отображающую среднее значение
    geom_hline(aes(yintercept = mean(mean)), linetype = 2) +
    # изменяем оформление некоторых элементов графика для улучшения
    # читабельности
    labs(
        y = 'length of the vocal tract',
        caption = 'data from [Hatano et.al 2012]'
    )
