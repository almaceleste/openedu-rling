# Напишите функцию is.odd(), которая возвращает значение TRUE, если число
# символов в строке нечетно, FALSE, если число символов в строке четно.

is.odd <- function(x){
    return(nchar(x) %% 2 == 1)
}

is.odd('test')
is.odd('test1')
