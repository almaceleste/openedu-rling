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

10/125
