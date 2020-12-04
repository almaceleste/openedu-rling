is.palindrome <- function(x) {
  x <- stringi::stri_trans_general(x, 'Accents-Any')
  x <- tolower(stringr::str_replace_all(x, '\\W', ''))
  n <- nchar(x)
  z <- stringr::str_c(substring(x, n:1, n:1), sep = '', collapse = '')

  print(x)
  print(z)

  return(x == z)
}

is.palindrome('мат и тут и там') # русский
is.palindrome('Madam, I’m Adam') # английский
is.palindrome('Sum summus mus') # латынь
is.palindrome('Νίψον ανομήματα μη μόναν όψιν') # греческий
is.palindrome('Saippuakivikauppias') # финский
is.palindrome('Català, a l’atac') # каталанский
is.palindrome('Kobyła ma mały bok') # польский
