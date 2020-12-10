# Данное задание основано на исследовании (Dobrushina, Moroz in press),
# посвященное многоязычию в Дагестане. В разных селах опрашивалось как можно
# большее число людей о языках, на которых говорили опрашиваемые и их предки. В
# датасет собраны данные по следующим переменным:
# index — индекс носителя
# residence — населенный пункт
# sex — пол носителя
# year_of_birth_dec — декада, в которой родился носитель
# Aghul…Zilo — знание языков/диалектов отличных от родного
# Посчитайте долю знающих русский язык у носителей до 1919 года. В каком селении
# этот процент больше всего?
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/daghestanian_multilingualism.csv

library(tidyverse)

x <- read_csv('datasets/daghestanian_multilingualism.csv')

x %>%
    filter(year_of_birth_dec < 1919) %>%
    group_by(residence) %>%
    mutate(one = 1) %>%
    summarise(
        all = sum(one),
        rus.all = sum(Russian),
        per = (rus.all / all * 100)
    ) %>%
    arrange(desc(per))
