# Programa en Python para ilustrar que las
# funciones pueden ser pasadas como argumentos a otras funciones

# Dom: list x number x number
# Rec: number
def gritar(texto):
    return texto.upper()


# Dom: list x number x number
# Rec: number
def susurrar(texto):
    return texto.lower()


# Dom: list x number x number
# Rec: number
def saludar(funcion):
    # Almacenando la función en un valor
    saludo = funcion("Hola, fui creado por una función pasado como argumento.")
    print(saludo)


# HOLA, FUI CREADO POR UNA FUNCIÓN PASADA COMO ARGUMENTO.
saludar(gritar)
# hola fui creado por una función pasada como argumento.
saludar(susurrar)
