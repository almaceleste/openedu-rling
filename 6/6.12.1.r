# Данное задание основано на материале диссертации (Coretta 2017) про исландские
# придыхательные согласные. Посчитайте 95% доверительный интервал для средней
# длительности гласного (переменная vowel.dur) после непридыхательных
# (переменная aspiration) для каждого диктора. Укажите диктора, у которого
# получилось наибольший доверительный интервал. Датасет доступен здесь.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/iclandic.aspirated.csv

library(tidyverse)

coretta <- read_tsv('datasets/iclandic.aspirated.csv')

coretta %>%
    filter(aspiration == 'no') %>%
    mutate(scaled = scale(vowel.dur)) %>%
    group_by(speaker) %>%
    summarise(
        mean = mean(scaled),
        min = mean - 1.96 * sd(scaled) / sqrt(n()),
        max = mean + 1.96 * sd(scaled) / sqrt(n()),
        ci = max - min
    ) %>%
    arrange(desc(ci))
