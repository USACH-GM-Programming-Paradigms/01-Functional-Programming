def sumatoria_natural_recursion(n):
    if n == 1:
        return n
    else:
        return n + sumatoria_natural_recursion(n - 1)


def sumatoria_tail_recursion(n, accum):
    if n == 0:
        return accum
    else:
        return sumatoria_tail_recursion(n - 1, accum + n)


# Sumatoria de 4 = 10
print(sumatoria_natural_recursion(4))


# Sumatoria de 4 = 10
print(sumatoria_tail_recursion(4, 0))
