# Найдите в базе данных пакета gutenbergr автора, родившегося раньше всех (я
# использовал датасет gutenberg_metadata). В ответе приведите число файлов с его
# произведением, которые можно скачать из базы данных (не забудьте посмотреть в
# help). Постарайтесь узнать это в одном конвеере.

library(tidyverse)
library(gutenbergr)

gutenberg_authors %>%
    arrange(birthdate) %>%
    select(author) %>%
    head(1) %>%
    inner_join(gutenberg_metadata) %>%
    filter(has_text == TRUE) %>%
    nrow()
