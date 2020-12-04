library(tidyverse)

coretta <- read_tsv('https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/iclandic.aspirated.csv')

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
