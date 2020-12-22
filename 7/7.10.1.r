# В работе [Coates, Leech 1980: 31] приводятся результаты исследования значений
# двух модальных глаголов в британском и американском английском. Авторы
# выделяют два значения в употреблении модальных глаголов: буквальное (you must
# read it) и эпистемическое (you must be kidding). Проанализируйте датасет и
# определите распределение значений какого глагола различно в британском и
# американском английском.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/coates_leech.csv

# must (решение не найдено)

library(tidyverse)

x <- read_csv('./datasets/coates_leech.csv')

must <- x %>%
    filter(word == 'must')
have <- x %>%
    filter(word == 'have to')

# m <-
    chisq.test(must$var, must$meaning, rescale.p = FALSE)
# h <-
    chisq.test(have$var, have$meaning)

# tm <-
    with(must, table(var, meaning))
# th <-
    with(have, table(var, meaning))

m$observed
m$expected

chisq.test(tm)

h$observed
h$expected

tm
th

table(must)

a <- x %>%
    filter(var == 'American')
b <- x %>%
    filter(var == 'British')


ta <- table(a)

chisq.test(a$word, a$meaning)
