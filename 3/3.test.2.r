is.upper <- function(x) {
  return(x == toupper(x))
}

toggle.case <- function(x) {
  if (is.upper(x)) return(tolower(x))
  else return(toupper(x))
}

mirror_case <- function(x){
  stringr::str_replace_all(x, '\\w', toggle.case)
}

mirror_case('testTEST#3á тЁестÁ_ ё ТЕСТ')
