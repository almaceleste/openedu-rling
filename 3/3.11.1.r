# Напишите функцию spaceless(), которая убирает повторяющиеся пробелы.

spaceless <- function(x) {
    return(stringr::str_replace_all(x, '\\s+', ' '))
}

spaceless('test     ,  test')
