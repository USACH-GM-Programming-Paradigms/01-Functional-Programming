# Situación:

# Implemente un programa que represente el registro de un alumno en el curso de paradigmas
# El alumno debe tener nombre, nota pep1, pep2 y pep3
# Asimismo, debe implementar las funcionalidades para:
# 1. Obtener cada nota
# 2. Cambiar o agregar cada nota
# 3. Obtener el promedio de notas


# Representación:
# NotasAlumno = List Nombre (str) X Pep1 (double) X Pep2 (double) X Pep3 (double)

# Constructor
# makeAlumno(nombre, pep1, pep2, pep3)

# Get
# getNombre(Alumno)
# getPep1(Alumno)
# getPep2(Alumno)
# getPep3(Alumno)

# Set
# setNombre(Alumno)
# setPep1(Alumno)
# setPep2(Alumno)
# setPep3(Alumno)

# Promedio
# promedio(Alumno)


# TDA Funcional

# Representación:

# Type Alumno = List Nombre X Notas
# Type Nombre = str
# Type Notas = List Nota
# Type Nota = float

# Constructor de alumno
# Dominio: nombre(str) X notas(list)
# Rec: Alumno
# Ejemplo: makeAlumno("gonzalo", [7,7,6])
def makeAlumno(nombre, notas):
    return [nombre, notas]


# Constructor de notas
# Dominio: int X int X int
# Rec: Nota
# Ejemplo: makeNotas([7,7,6])
def makeNotas(pep1, pep2, pep3):
    return [pep1, pep2, pep3]


# Capas alumno
# Capa selectora
# Dominio: Alumno
# Rec: Nombre
# Ejemplo: getNombre(miAlumno)
def getNombre(alumno):
    return alumno[0]


# Dominio: Alumno
# Rec: Notas
# Ejemplo: getNotas(miAlumno)
def getNotas(alumno):
    return alumno[1]


# Dominio: Alumno
# Rec: int
# Ejemplo: getPep1Resultado(miAlumno)
def getPep1Resultado(alumno):
    return getPep1(getNotas(alumno))


# Dominio: Alumno
# Rec: int
# Ejemplo: getPep2Resultado(miAlumno)
def getPep2Resultado(alumno):
    return getPep2(getNotas(alumno))


# Dominio: Alumno
# Rec: int
# Ejemplo: getPep3Resultado(miAlumno)
def getPep3Resultado(alumno):
    return getPep3(getNotas(alumno))


# Dominio: Alumno X int
# Rec: Alumno
# Ejemplo: setNotaPep1(miAlumno, 4)
def setNotaPep1(alumno, newPep1):
    return makeAlumno(getNombre(alumno), setPep1(getNotas(alumno), newPep1))


# Dominio: Alumno X int
# Rec: Alumno
# Ejemplo: setNotaPep2(miAlumno, 4)
def setNotaPep2(alumno, newPep2):
    return makeAlumno(getNombre(alumno), setPep2(getNotas(alumno), newPep2))


# Dominio: Alumno X int
# Rec: Alumno
# Ejemplo: setNotaPep3(miAlumno, 4)
def setNotaPep3(alumno, newPep3):
    return makeAlumno(getNombre(alumno), setPep3(getNotas(alumno), newPep3))


# Dominio: Alumno
# Rec: int
# Ejemplo: calculate_avg_notas(miAlumno)
def calculate_avg_notas(alumno):
    return calculate_avg(getNotas(alumno))


# Dominio: Alumno
# Rec: Alumno
# Ejemplo: alumno_solo_notas_mayores_a_4(miAlumno)
def alumno_solo_notas_mayores_a_4(alumno):
    return makeAlumno(getNombre(alumno), remove_notas_less_than_4(getNotas(alumno)))


# Dominio: Alumno
# Rec: Alumno
# Ejemplo: alumno_notas_subida_1_pto(miAlumno)
def alumno_notas_subida_1_pto(alumno):
    return makeAlumno(getNombre(alumno), subir_1pto_notas(getNotas(alumno)))


# Dominio: Alumno
# Rec: int
# Ejemplo: buena_onda(miAlumno)
def buena_onda(alumno):
    # High Order Function: las funciones puede ser input o outputs
    return calculate_avg_notas(
        alumno_solo_notas_mayores_a_4(alumno_notas_subida_1_pto(alumno))
    )


# Capas Notas
# Dominio: Notas
# Rec: int
# Ejemplo: getPep1([1,2,3])
def getPep1(notas):
    return notas[0]


# Dominio: Notas
# Rec: int
# Ejemplo: getPep2([1,2,3])
def getPep2(notas):
    return notas[1]


# Dominio: Notas
# Rec: int
# Ejemplo: getPep3([1,2,3])
def getPep3(notas):
    return notas[2]


# Dominio: Notas X int
# Rec: Notas
# Ejemplo: setPep1([1,2,3], 4)
def setPep1(notas, newPep1):
    return makeNotas(newPep1, getPep2(notas), getPep3(notas))


# Dominio: Notas X int
# Rec: Notas
# Ejemplo: setPep2([1,2,3], 4)
def setPep2(notas, newPep2):
    return makeNotas(getPep1(notas), newPep2, getPep3(notas))


# Dominio: Notas X int
# Rec: Notas
# Ejemplo: setPep3([1,2,3], 4)
def setPep3(notas, newPep3):
    return makeNotas(getPep1(notas), getPep2(notas), newPep3)


# Dominio: Notas
# Rec: int
# Ejemplo: calculate_avg([1,2,3])
def calculate_avg(notas):
    from functools import reduce

    # En Scheme, reduce se llama apply, es lo mismo
    return reduce(lambda a, b: a + b, notas) / len(notas)


# Dominio: Notas
# Rec: Notas
# Ejemplo: remove_notas_less_than_4([1,2,3])
def remove_notas_less_than_4(notas):
    # En Scheme, filter retorna una lista
    # En Python no, hay que transformarlo en lista
    # Filtro solo las notas mayores a 4
    return list(filter(lambda x: x > 4, notas))


# Dominio: Notas
# Rec: Notas
# Ejemplo: subir_1pto_notas([1,2,3])
def subir_1pto_notas(notas):
    # En Scheme, map retorna una lista
    # En Python no, hay que transformarlo en lista
    # Map la suma de un elemento + 1 en todos los elementos de notas
    return list(map(lambda x: x + 1, notas))


# Estado inicial: estudiante Gonzalo con notas: PEP1 2, PEP2 3, PEP3 todavia no la da (None)
alumno_1 = makeAlumno("gonzalo", [2, 3, None])
print(alumno_1)
alumno_2 = setNotaPep3(alumno_1, 5)
print(alumno_2)
alumno_3 = setNotaPep1(alumno_2, 6)
print(alumno_3)
print(getPep2Resultado(alumno_3))

# Calculos sobre las notas
avg_notas_alumno3 = calculate_avg_notas(alumno_3)
alumno_3_solo_con_azules = alumno_solo_notas_mayores_a_4(alumno_3)
print(alumno_3_solo_con_azules)
alumno_3_con_subida_ptje = alumno_notas_subida_1_pto(alumno_3)
print(alumno_3_con_subida_ptje)

print(buena_onda(alumno_3))
