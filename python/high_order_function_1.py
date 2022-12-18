# Programa en Python para ilustrar que las
# funciones pueden ser pasadas como argumentos a otras funciones

# Dom: str
# Rec: str
def gritar(texto):
    return texto.upper()


# Dom: str
# Rec: str
def susurrar(texto):
    return texto.lower()


# Dom: function
# Rec: void
def saludar(funcion):
    # Almacenando la función en un valor
    saludo = funcion("Hola, fui creado por una función pasado como argumento.")
    print(saludo)


# HOLA, FUI CREADO POR UNA FUNCIÓN PASADA COMO ARGUMENTO.
saludar(gritar)
# hola fui creado por una función pasada como argumento.
saludar(susurrar)
