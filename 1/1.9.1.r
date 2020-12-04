f <- function(x) {
  sin(x)^3/(sin(x)^3+cos(x)^3)
}
integrate(f, 0, pi/2)
