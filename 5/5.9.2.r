# Воспользуйтесь пакетами gutenbergr и tidytext, чтобы ответить на вопрос, в
# каком из текстов Люиса Кэррэла he встречается чаще чем she?

library(tidyverse)
library(gutenbergr)
library(tidytext)

gutenberg_metadata %>%
    select(author) %>%
    slice(grep('Carroll', author)) # %>%

alice <- "Alice's Adventures in Wonderland"
glass <- "Through the Looking-Glass"

alice_text <- gutenberg_download(
    gutenberg_works(title == alice) %>%
        select(gutenberg_id)
)

glass_text <- gutenberg_download(
    gutenberg_works(title == glass) %>%
        select(gutenberg_id)
)

she.he <- function(x) {
    x %>%
        unnest_tokens(word, text) %>%
        count(word) %>%
        slice(grep('^[s]?he$', word)) %>%
        arrange(desc(n))
}

cat("\n", alice, "\n")
she.he(alice_text)
cat("\n", glass, "\n")
she.he(glass_text)
