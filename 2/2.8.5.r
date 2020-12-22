# В датасете посчитайте долю полиглотов отдельно для мужчин и для женщин,
# рожденных до 1919 года. В скольких селениях полученное значение больше 0.1?
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/daghestanian_multilingualism.csv

# 9 (решение не найдено)

library(tidyverse)

x <- read_csv('datasets/daghestanian_multilingualism.csv')

# вычисляем общее количество женщин, мужчин и жителей в каждом селении
x %>%
    group_by(residence, sex) %>%
    mutate(one = 1) %>%
    summarise(total = sum(one)) %>%
    spread(sex, total) %>%
    mutate(
        f.total = f,
        m.total = m,
        total = f.total + m.total
    ) %>%
    select(residence, f.total, m.total, total) -> residences

# вычисляем общее количество женщин, мужчин и жителей до 1919 в каждом селении
x %>%
    filter(year_of_birth_dec < 1919) %>%
    group_by(residence, sex) %>%
    mutate(one = 1) %>%
    summarise(total = sum(one)) %>%
    spread(sex, total) %>%
    mutate(
        f.1919 = f,
        m.1919 = m,
        total.1919 = f.1919 + m.1919
    ) %>%
    select(residence, f.1919, m.1919, total.1919) %>%
    inner_join(residences) -> residences

# определяем для каждого жителя, знает ли он или она другие языки
x %>%
    gather(key = langname, value = langs, Aghul:Zilo) %>%
    group_by(index) %>%
    summarise(langs = sum(langs)) %>%
    mutate(polyglot = ifelse(langs == 0, 0, 1)) -> residents
# добавляем необходимые столбцы
inner_join(x, residents) %>%
    mutate(year = year_of_birth_dec) %>%
    select(index, year, residence, sex, langs, polyglot) -> residents

# вычисляем общее количество полиглотов для женщин, мужчин и жителей в каждом
# селении
residents %>%
    group_by(residence, sex) %>%
    summarise(polyglots = sum(polyglot)) %>%
    spread(sex, polyglots) %>%
    mutate(
        f.poly.total = f,
        m.poly.total = m,
        poly.total = f.poly.total + m.poly.total
    ) %>%
    select(residence, f.poly.total, m.poly.total, poly.total) %>%
    inner_join(residences) -> residences

# вычисляем общее количество полиглотов для женщин, мужчин и жителей до 1919 в
# каждом селении
residents %>%
    filter(year < 1919) %>%
    group_by(residence, sex) %>%
    summarise(polyglots = sum(polyglot)) %>%
    spread(sex, polyglots) %>%
    mutate(
        f.poly.1919 = f,
        m.poly.1919 = m,
        poly.1919 = f.poly.1919 + m.poly.1919
    ) %>%
    select(residence, f.poly.1919, m.poly.1919, poly.1919) %>%
    inner_join(residences) -> residences

# вычисляем долю полиглотов до 1919 по отношению к общему количеству жителей
# своего пола
residences %>%
    mutate(
        f.prop = f.poly.1919 / f.total,
        m.prop = m.poly.1919 / m.total
    ) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(
        residence, f.poly.1919, m.poly.1919,
        f.total, m.total, f.prop, m.prop
    )

# вычисляем долю полиглотов до 1919 по отношению к общему количеству полиглотов
# своего пола
residences %>%
    mutate(
        f.prop = f.poly.1919 / f.poly.total,
        m.prop = m.poly.1919 / m.poly.total
    ) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(
        residence, f.poly.1919, m.poly.1919,
        f.poly.total, m.poly.total, f.prop, m.prop
    )

# вычисляем долю полиглотов до 1919 по отношению к общему количеству жителей
# (наиболее близко)
residences %>%
    mutate(
        f.prop = f.poly.1919 / total,
        m.prop = m.poly.1919 / total
    ) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(residence, f.poly.1919, m.poly.1919, total, f.prop, m.prop)

# вычисляем долю полиглотов до 1919 по отношению к общему количеству
# жителей-полиглотов (второе по близости)
residences %>%
    mutate(
        f.prop = f.poly.1919 / poly.total,
        m.prop = m.poly.1919 / poly.total
    ) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(residence, f.poly.1919, m.poly.1919, poly.total, f.prop, m.prop)

# вычисляем долю полиглотов до 1919 по отношению к общему количеству жителей до
# 1919
residences %>%
    mutate(
        f.prop = f.poly.1919 / total.1919,
        m.prop = m.poly.1919 / total.1919
    ) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(residence, f.poly.1919, m.poly.1919, total.1919, f.prop, m.prop)

# вычисляем долю полиглотов до 1919 по отношению к общему количеству
# жителей-полиглотов до 1919
residences %>%
    mutate(
        f.prop = f.poly.1919 / poly.1919,
        m.prop = m.poly.1919 / poly.1919) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(residence, f.poly.1919, m.poly.1919, poly.1919, f.prop, m.prop)

# вычисляем долю полиглотов до 1919 по отношению к общему количеству жителей
# своего пола до 1919
residences %>%
    mutate(
        f.prop = f.poly.1919 / f.1919,
        m.prop = m.poly.1919 / m.1919
    ) %>%
    filter(
        f.prop > 0.1,
        m.prop > 0.1
    ) %>%
    select(residence, f.poly.1919, m.poly.1919, f.1919, m.1919, f.prop, m.prop)
