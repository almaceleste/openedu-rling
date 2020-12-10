# Дано рекурентное определение чисел Фибоначчи:
# f(0)=0, f(1)=1, f(2)=1, f(n)=f(n−1)+f(n−2)
# Напишите функцию [code]fibonacci()[/code], которая возвращает nn-ный член
# последовательности (не больше 7 строчек кода):

fibonacci <- function(n) {
  if (n == 0) 0
  else if (n <= 2) 1
  else fibonacci(n - 1) + fibonacci(n - 2)
}
