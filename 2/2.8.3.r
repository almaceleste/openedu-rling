# Данное задание основано на материале диссертации (Coretta 2017) про исландские
# придыхательные согласные. Посчитайте среднюю длительность гласного (переменная
# vowel.dur) и длительность звонкого участка (переменная voicing.dur) в словах с
# придыханием и без (переменная aspiration) для каждого диктора (переменная
# speaker), используя функцию summarise_at(). Укажите диктора, длительность
# звонкого участка или длительность гласного которого в придыхательных больше,
# чем в непридыхательных. Датасет доступен здесь.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/iclandic.aspirated.csv

# ни один из перечисленных

library(tidyverse)

x <- read_tsv('datasets/iclandic.aspirated.csv')

x %>%
    select(speaker, vowel.dur, voicing.dur, aspiration) %>%
    group_by(speaker, aspiration) %>%
    summarise_at(
        vars(vowel.dur, voicing.dur),
        mean, na.rm = TRUE
    ) %>%
    mutate(
        vowel.mean = mean(vowel.dur),
        voicing.mean = mean(voicing.dur)
    ) %>%
    filter(aspiration == 'yes') %>%
    mutate(
        vowel.asp = (vowel.dur > vowel.mean),
        voicing.asp = (voicing.dur > voicing.mean)
    )
