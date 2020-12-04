# Данное задание основано на диссертации (Coretta 2017) про исландские
# придыхательные согласные. Посчитайте статистическую значимость зависимости
# средней длительности гласного (переменная vowel.dur) в зависимости от
# придыхательности (переменная aspiration) для каждого диктора. В ответе укажите
# диктора, у которого наблюдается наибольшее различие средних (t-значение).
# Датасет доступен здесь.

library(tidyverse)

x <- read_tsv('https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/iclandic.aspirated.csv')

x %>%
    select(speaker, aspiration, vowel.dur) -> vowel
    # select(speaker, aspiration, vowel.dur) %>%
    # group_by(speaker, aspiration) %>%
    # summarise(vowel = mean(vowel.dur)) %>%
    # spread(key = aspiration, value = vowel)

test <- function(dictor) {
    vowel %>%
        filter(speaker == dictor) -> dictor

    return(t.test(dictor$vowel.dur~dictor$aspiration))
}

test('brs02')
test('bte03')
test('jj04')
test('shg05')
test('tt01')
