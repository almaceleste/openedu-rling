start_time <- Sys.time()

# stringr::str_view('test', 't')
# plot(mtcars)
# data(mtcars)
# mtcars

# -------

# library(tidyverse)
# # df <- read_csv("https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/data.japanese.vocal.tract.length.csv")
# df <- read_csv('./data.japanese.vocal.tract.length.csv')
# # df <- read_csv('./data.japanese.vocal.tract.length_fake_100.csv')
# # df <- read_csv('./data.japanese.vocal.tract.length_fake_1000.csv')

# df_long <- df %>%
# gather(key = vowel, value = vtl, a.vtl:u.vtl) %>%
# mutate(vowel = substr(vowel,1,1))

# df_long %>%
# ggplot(aes(ID, vtl, label = vowel))+
# geom_text()+
# labs(y ="length of the vocal tract", x="speakers", caption="data from [Hatano et. al 2012]")

# -------

library(lingtypology)

map.feature(
    lang.aff('Slavic'),
    map.orientation = 'Atlantic')

# end_time <- Sys.time()
# end_time - start_time
