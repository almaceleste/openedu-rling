library(tidyverse)

moroz <- read_csv('https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/kuban_speech_rate.csv')

moroz %>%
    filter(type == 'narrative') -> narrative

t.test(narrative$mean, mu = 5.31)
