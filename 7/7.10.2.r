# В пятой главе WALS приводится выборка из 567 языков, в 97 из которых
# встретился хотя бы один увулярный звук. В базе данных PHOIBLE из выборки
# размером 2155 языков увулярные встретились в 419 языках. Если принимать
# распределение, представленное в WALS за вероятность встретить язык с увулярным
# согласным, какая вероятность получить результаты, представленные в PHOIBLE?
# Приведите соответствующее p-value.

# 0.004612549 (~0.004613)

library(tidyverse)

# chisq.test(c(419, 2155), p = c(97, 567))

# t.test(df, mu = e)

# choksy bimon
expected_uvul  <- 97 / 567 # WALS
n <- 2155
observed_uvul  <- 419
binom.test(observed_uvul, n, expected_uvul)

# # choksy chisq
# df <-
#     data.frame(
#         row.names = c("WALS", "PHOIBLE"),
#         uvul = c(97, 419),
#         no_uvul = c(567 - 97, 2155 - 419)
# )

# df
# chisq.test(df)

# chisq.test(df, p = c(e, e))

# # manual chisq
# e <- 97 / 567
# o <- 419 / 2155

# chisq.test(c(419, (2155 - 419)), p = c(e, e), rescale.p = TRUE)

# chisq <- (o - e)^2 / e
