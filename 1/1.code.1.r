# Напишите выражение на R, которое вычисляет корни квадратного уравнения
# y = 3−2πx+x²
# , используя функцию polyroot() (она, по умолчанию возвращает мнимые числа — не
# пугайтесь) (не больше 5 строчек кода).

polyroot(c(3, -2 * pi, 1))
