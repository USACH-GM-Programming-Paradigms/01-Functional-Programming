# Recursion

# Ejemplo: suma de numeros contenidos en una lista

# Dom: list x number x number
# Rec: number
# Tipo de recursión: tail recursion
def sumTail(array, size, Sum=0):
    # Base Case/Caso Borde
    if size == 0:
        return Sum

    return sumTail(array, size - 1, Sum + array[size - 1])


# Dom: list x number x number
# Rec: number
# Tipo de recursión: tail recursion
def multTail(array, size, Mult=1):
    if size == 0:
        return Mult

    return multTail(array, size - 1, Mult * array[size - 1])


# Dom: number
# Rec: number
# Tipo de recursión: natural
def sumNatural(n):
    if n == 0:
        return 0
    return n + sumNatural(n - 1)


# High order functions

## Reducer (tambien llamado apply o reduce)
def apply(my_function, my_list, size, Acc):
    if size == 0:
        return Acc

    return apply(my_function, my_list, size - 1, my_function(Acc, my_list[size - 1]))


def apply2(my_function, my_list, acc):
    def apply_inner(my_function, my_list, size, acc):
        if size == 0:
            return acc

        return apply_inner(my_function, my_list, size - 1, my_function(acc, my_list[size - 1]))
    
    return apply_inner(my_function, my_list, len(my_list), acc)

# Dom: list x number x number
# Rec: number
def sum_operator(a, b):
    return a + b


# Dom: list x number x number
# Rec: number
def mult_operator(a, b):
    return a * b


## Map

# Dom: function x lista
# Rec: lista
def mymap(my_function, my_list):
    result = []
    for element in my_list:
        result.append(my_function(element))
    return result

# Rec: lista
def square_list(my_list):
    result = []
    for element in my_list:
        result.append(element**2)
    return result


# nums = [1, 2, 3, 4, 5]
# nums_squared = map(lambda x: x * x, nums)
# for num in nums_squared:
#    print(num)


# my_list = [my_function(x) for x in my_list]

## Filter
def extract_even(numbers):
    even_numbers = []
    for number in numbers:
        if number % 2 == 0:  # Filtering condition
            even_numbers.append(number)
    return even_numbers


def filter(function_predicate, my_list):
    result = []
    for element in my_list:
        if function_predicate(element):  # Filtering condition
            result.append(element)
    return result


def is_even(number):
    if number % 2 == 0:
        return True
    else:
        return False


if __name__ == "__main__":
    array = [1, 2, 3, 4]
    size = len(array)

    print(sumTail(array, size))
    print(multTail(array, size))
    print(multTail(array, size))
    print(apply(lambda x, y: x * y, array, len(array), 1))
    print(apply(lambda x, y: x + y, array, len(array), 0))

    print(mymap(lambda x: x**2, array))
    print(mymap(lambda x: x * 2, array))

    print(extract_even(array))
    print(filter(lambda x: x % 2, array))
    print(filter(lambda x: 2 <= x <= 4, array))
