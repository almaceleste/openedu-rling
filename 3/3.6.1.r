# В датафрейм cities в переменной city записан список городов. Создайте новую
# переменную cities_adj, содержащую переменную с прилагательными мужского рода
# единственного числа в именительном падеже и в нижнем регистре от каждого из
# городов. Постарайтесь сделать это в одном пайпе.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/city.csv

cities <- read_csv('datasets/city.csv')

cities %>%
    mutate(
        cities_adj = str_replace_all(cities$city,
        c(
            'а$' = '',
            'о$' = '',
            'ск$' = '',
            'нь$' = 'н',
            'мь$' = 'м',
            'цк$' = 'ц')
        )
    ) %>%
    mutate(cities_adj = str_c(cities_adj, 'ский', sep = '')) %>%
    mutate(cities_adj = str_replace(cities_adj, 'цский$', 'цкий')) %>%
    # mutate(
    #     cities_adj = str_replace(cities_adj, 'семфирополь', 'симферополь')
    # ) %>%
    mutate(cities_adj = tolower(cities_adj)) -> cities

cities
