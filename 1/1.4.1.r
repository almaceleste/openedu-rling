# Напишите код, выводящий на экран вектор со всеми числами между 700 и 1000,
# делящиеся на 43 (не больше 5 строчек кода).

n <- 700:1000
n[n %% 43 == 0]
