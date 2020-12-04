x <- read_tsv('/tmp/iclandic.aspirated.csv')

x %>% 
  select(speaker, vowel.dur, voicing.dur, aspiration) %>% 
  group_by(speaker, aspiration) %>%
  summarise_at(vars(vowel.dur, voicing.dur),
               mean, na.rm = TRUE) %>% 
  mutate(vowel.mean = mean(vowel.dur),
         voicing.mean = mean(voicing.dur)) %>% 
  filter(aspiration == 'yes') %>% 
  mutate(vowel.asp = (vowel.dur > vowel.mean), voicing.asp = (voicing.dur > voicing.mean))
