# Dom: number
# Rec: number
# Tipo de recursión: natural recursion
def sumatoria_natural_recursion(n):
    if n == 1:
        return n
    else:
        return n + sumatoria_natural_recursion(n - 1)


# Sumatoria de 4 = 10
print(sumatoria_natural_recursion(4))

# 4 + sumatoria_natural_recursion(3)
# 4 + 3 + sumatoria_natural_recursion(2)
# 4 + 3 + 2 + sumatoria_natural_recursion(1)
# 4 + 3 + 2 + 1
# 10

# Dom: number x number
# Rec: number
# Tipo de recursión: tail recursion
def sumatoria_tail_recursion(n, acc):
    if n == 0:
        return acc
    else:
        return sumatoria_tail_recursion(n - 1, acc + n)


# Sumatoria de 4 = 10
# print(sumatoria_tail_recursion(4, 0))

print(sumatoria_tail_recursion(4, 0))

# n = 4, acc = 0 + 4
# n = 3, acc = 4 + 3 = 7
# n = 2, acc = 7 + 2 = 9
# n = 1, acc = 9 + 1 = 10
# n = 0, return 10

# Dom: number x number
# Rec: number
# Tipo de recursión: tail recursion
def sumatoria_tail_recursion_outside(n):
    def sumatoria_inner(n, acc):
        if n == 0:
            return acc
        else:
            return sumatoria_inner(n - 1, acc + n)

    return sumatoria_inner(n, 0)


print(sumatoria_tail_recursion_outside(4))
