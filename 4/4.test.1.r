# В работе [Hatano, Kitamura, Takemoto, Mokhtari, Honda, Masaki 2012]
# исследовалась длина голосового тракта при произнесении разных гласных
# (переменные a.vtl, i.vtl…). В исследовании приняли участие 15 носителей
# японского языка. В датасет записаны их рост (body.height) и возраст (age).
# Напишите скрипт, который максимально точно воспроизводит график и приложите
# его и свой код в качестве решения.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/data.japanese.vocal.tract.length.csv

start_time <- Sys.time()

library(tidyverse)

x <- read_csv('datasets/data.japanese.vocal.tract.length.csv')
# x <- read_csv('datasets/data.japanese.vocal.tract.length_fake_100.csv')
# x <- read_csv('datasets/data.japanese.vocal.tract.length_fake_1000.csv')

x %>%
    # сокращаем имена столбцов для более удобного отображения на графике
    mutate(a = a.vtl, e = e.vtl, i = i.vtl, o = o.vtl, u = u.vtl) %>%
    # собираем данные, предназначенные для отображения:
    # vowel - названия гласных, length - соответствующая длина голосового тракта
    gather(key = vowel, value = length, a:u) %>%
    # данные для графика: x - ID спикера, y - длина голосового тракта,
    # label - названия гласных
    ggplot(aes(x = ID, y = length, label = vowel)) +
    # отображаем данные на графике, используя названия грасных
    geom_text() +
    # изменяем оформление некоторых элементов графика для улучшения
    # читабельности
    labs(
        x = 'speakers',
        y = 'length of the vocal tract',
        caption = 'data from [Hatano et.al 2012]'
    )

end_time <- Sys.time()

end_time - start_time