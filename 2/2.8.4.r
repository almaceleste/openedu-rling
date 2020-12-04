x <- read_csv('/tmp/daghestanian_multilingualism.csv')

x %>% 
  filter(year_of_birth_dec < 1919) %>% 
  group_by(residence) %>% 
  mutate(one = 1) %>% 
  summarise(all = sum(one),
            rus.all = sum(Russian),
            per = (rus.all/all*100)) %>% 
  arrange(desc(per))
