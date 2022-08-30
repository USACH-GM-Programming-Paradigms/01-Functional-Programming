# Demostración de la Currificación de la composición de una función

# Dom: list x number x number
# Rec: number
def transformar(b, c, d):
    def a(x):
        return b(c(d(x)))

    return a


# Dom: list x number x number
# Rec: number
def dias_a_horas(numero_dias):
    """Función que convierte dias a horas."""
    return numero_dias * 24


# Dom: list x number x number
# Rec: number
def horas_a_minutos(numero_horas):
    """Función que convierte horas a minutos."""
    return numero_horas * 60


# Dom: list x number x number
# Rec: number
def minutos_a_segundos(numero_minutos):
    """Función que convierte minutos a segundos."""
    return numero_minutos * 60


if __name__ == "__main__":
    transformar_dias_a_segundos = transformar(
        minutos_a_segundos, horas_a_minutos, dias_a_horas
    )
    dias = 10
    segundos = transformar_dias_a_segundos(dias)
    # 10 dias = 864,000 seg
    print(segundos)
