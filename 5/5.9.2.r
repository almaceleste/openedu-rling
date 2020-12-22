# Воспользуйтесь пакетами gutenbergr и tidytext, чтобы ответить на вопрос, в
# каком из текстов Люиса Кэррэла he встречается чаще чем she?
# варианты:
# - Alice's Adventures in Wonderland, gutenberg_id 11
# - Through the Looking-Glass, gutenberg_id 12

# ни в одном из них

library(tidyverse)
library(gutenbergr)
library(tidytext)

# gutenberg_metadata %>%
#     filter(author == 'Carroll, Lewis')

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

she_he <- function(x) {
    x %>%
        unnest_tokens(word, text) %>%
        count(word) %>%
        slice(grep('^[s]?he$', word)) %>%
        arrange(desc(n))
}

cat("\n", alice, "\n")
she_he(alice_text)
cat("\n", glass, "\n")
she_he(glass_text)
