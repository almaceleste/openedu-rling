# В русском и польском языках существует чередование винительного и предложного
# падежей в маркировании аргументов глаголов помещения (положить на столе vs
# положить на стол). Студентка Школы Лингвистики, Полина Налётова, исследовала
# предлоги "в" и "на" в русском и польском. Проанализируйте датасет и определите
# в каком языке распределение падежей при обоих предлогах статистически значимо
# различается?
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/slavic_case_alternation.csv

library(tidyverse)

x <- read_tsv('datasets/slavic_case_alternation.csv')

rus <- x %>%
    filter(lang == 'rus') %>%
    select(-lang) %>%
    table()

pol <- x %>%
    filter(lang == 'pol') %>%
    select(-lang) %>%
    table()

x_rus <-
    chisq.test(rus)
x_pol <-
    chisq.test(pol)

x_rus$expected
x_pol$expected

fisher.test(rus)
fisher.test(pol)
