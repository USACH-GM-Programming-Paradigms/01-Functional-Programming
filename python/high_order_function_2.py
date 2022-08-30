# Programa en Python para ilustrar que
# una función puede retornar otra función

# Dom: list x number x number
# Rec: number
def crear_sumador(x):
    def suma(y):
        return x + y

    return suma


suma_15 = crear_sumador(15)

# Output: 25
print(suma_15(10))
