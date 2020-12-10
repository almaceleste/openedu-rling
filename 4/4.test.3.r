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
    # сохраняем данные во временную переменную для последующего использования
    gather(key = vowel, value = length, a:u) -> tmp

tmp %>%
    # данные для графика: x - длина голосового тракта,
    # заполнение цветом в зависимости от названия гласной
    ggplot(
        aes(length,
        fill = vowel)) +
    # рисуем общую гистограмму длинн голосового тракта, удалив столбец,
    # по которому будем делать фасетирование
    geom_histogram(
        data = tmp[, - which(names(tmp) == 'vowel')],
        aes(length),
        bins = nclass.Sturges(tmp$length),
        fill = 'gray') +
    # рисуем гистограмму длинн голосового тракта
    # и фасетируем её по отдельным гласным
    geom_histogram(
        bins = nclass.Sturges(tmp$length),
        show.legend = FALSE) +
    facet_wrap(~vowel) +
    # изменяем оформление некоторых элементов графика для улучшения
    # читабельности
    labs(
        x = 'length of the vocal tract',
        caption = 'data from [Hatano et.al 2012]'
    )
