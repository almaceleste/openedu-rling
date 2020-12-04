library(tidyverse)
library(gutenbergr)

gutenberg_authors %>%
    arrange(birthdate) %>%
    select(author) %>%
    head(1) %>%
    inner_join(gutenberg_metadata) %>%
    filter(has_text == TRUE) %>%
    nrow()
