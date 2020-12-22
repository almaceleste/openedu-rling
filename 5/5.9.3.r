# Сравните количество именных классов в двух базах данных: WALS
# (wals.feature("30A")) и AUTOTYP (autotyp.feature("Gender")). Приведите
# значения к шкале (0 vs. 2 vs. 3 vs. 4 vs. > 4) (обратите внимание на столбец
# Gender.Presence в базе данных Autotyp, если там FALSE, значит исследователь
# утверждает, что в языке 0 классов, правда иногда там NA, поменяйте его на
# TRUE, если в столбце Gender.n есть какое-то значение), уберите языки с
# пропущенными значениями и сравните значения языков, попавших в обе базы
# данных. В ответе приведите долю языков с разным значениями.

# 10/125

library(tidyverse)
library(lingtypology)

wals.feature('30A') %>%
    mutate(x = `30A`) %>%
    mutate(
        wals.n = case_when(
            x == 'None' ~ 0,
            x == 'One' ~ 1,
            x == 'Two' ~ 2,
            x == 'Three' ~ 3,
            x == 'Four' ~ 4,
            x == 'Five' ~ 5,
            x == 'Five or more' ~ 5,
        )
    ) %>%
    select(language, glottocode, wals.n) %>%
    arrange(language) %>%
    # unique() %>%
    na.omit() -> wals.gender

autotyp.feature('Gender') %>%
    mutate(glottocode = Glottocode) %>%
    mutate(x = Gender.n) %>%
    mutate(
        autotyp.n = case_when(
            Gender.Presence == FALSE ~ 0,
            x > 5 ~ 5,
            TRUE ~ as.numeric(x)
        )
    ) %>%
    select(language, glottocode, autotyp.n) %>%
    arrange(language) %>%
    # unique() %>%
    na.omit() -> autotyp.gender

inner_join(wals.gender, autotyp.gender) %>%
    filter(wals.n != autotyp.n)

# View(wals.gender)
# View(autotyp.feature('Gender'))
# View(inner_join(wals.gender, autotyp.gender))

10 / 125
