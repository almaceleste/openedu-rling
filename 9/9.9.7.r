# В работе [Kosheleva 2016] исследовалась сравнительная конструкция в русском
# языке (на материале НКРЯ). В датасете содержаться следующие переменные:
# - TYPE_OF_COMP — тип сравнительной конструкции ANALYTICAL или SYNTHETIC.
# - YEAR — год издания примера
# - TIE_MARKER — тип соединительного слова genitive case, chem. В остальных
#   случаях – no.
# - LENGTH — длинна прилагательного в слогах
# - SEQUENCE — если в сравнительной конструкции более чем один компаратив — yes.
#   В остальных случаях – no.
# - POSITIVE — прилагательное
# - LEFT_CONTEXT, MIDDLE, RIGHT_CONTEXT, “Example_ID” — относятся к корпусным
#   примерам.
# Постройте мультиномиальную регрессию, предсказывающую тип соединительного
# слова на основании переменных TYPE_OF_COMP, YEAR, LENGTH и SEQUENCE. На
# основании получившейся модели постройте предсказание для синтетической
# сравнительной конструкции с одним компративом и с четырехсложным
# прилагательным, опубликованной в 2018 году.
# https://raw.githubusercontent.com/agricolamz/r_on_line_course_data/master/Kosheleva_2016.csv

library(tidyverse)

x <- read_csv('datasets/Kosheleva_2016.csv')

model <- nnet::multinom(
    data = x,
    formula = TIE_MARKER ~ TYPE_OF_COMP + YEAR + LENGTH + SEQUENCE
)

predict(
    model,
    newdata = data.frame(
        TYPE_OF_COMP = 'SYNTHETIC',
        SEQUENCE = 'no',
        LENGTH = 4,
        YEAR = 2018
    )
)
