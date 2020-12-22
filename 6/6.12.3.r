# В выборке языков Южной Америки исследовалось в скольких языках есть послелоги
# (59), предлоги (5) и нет ни предлогов, ни послелогов (11). Приведите p-value,
# характеризующее вероятность иметь такие или еще большие отличия в
# распределении предлогов от предполагаемого распределения (Post — 49%, Prep —
# 43%, No adpositions — 3%). Данные взяты из базы данных SAILS
# (http://sails.clld.org/parameters/NP901). Предполагаемые распределения — взяты
# из WALS (http://wals.info/feature/85A).

# 4.165e-12

binom.test(5, (59 + 5 + 11), .43)
