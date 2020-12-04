my_function <- function(x){
  (1+2*x^2)*exp(x^2)
}
integrate(my_function,-1,1)