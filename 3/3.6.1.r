cities <- read_csv('/tmp/city.csv')

cities %>% 
  mutate(cities_adj = str_replace_all(cities$city,
    c(
      'а$' = '',
      'о$' = '',
      'ск$' = '',
      'нь$' = 'н',
      'мь$' = 'м',
      'цк$' = 'ц')
    )) %>% 
  mutate(cities_adj = str_c(cities_adj, 'ский', sep = '')) %>% 
  mutate(cities_adj = str_replace(cities_adj, 'цский$', 'цкий')) %>% 
  # mutate(cities_adj = str_replace(cities_adj, 'семфирополь', 'симферополь')) %>% 
  mutate(cities_adj = tolower(cities_adj)) -> cities
         
         