# Programa en Python para ilustrar que las
# funciones pueden ser pasadas como argumentos a otras funciones
def gritar(texto):
    return texto.upper()


def susurrar(texto):
    return texto.lower()


def saludar(funcion):
    # Almacenando la función en un valor
    saludo = funcion("Hola, fui creado por una función pasado como argumento.")
    print(saludo)


# HOLA, FUI CREADO POR UNA FUNCIÓN PASADA COMO ARGUMENTO.
saludar(gritar)
# hola fui creado por una función pasada como argumento.
saludar(susurrar)
