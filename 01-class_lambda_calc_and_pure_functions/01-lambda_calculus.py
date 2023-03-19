# Python Anonymous Functions
# Lambda Calculus in Python

# lambda [args] : expression
# The output only depends on the inputs

# Example 1: Finding the area of a triangle
# Anonymous Functions using Lambda Calculus
# Anonymous Function is when you have a Function without a name
triangle_area = lambda m, n: 1 / 2 * m * n
output = triangle_area(34, 24)
print("Area of the triangle: ", output)

# Example 2: A Function is a Anonymous Function but with a name
def calculate_triangule_area(m, n):
    return 1 / 2 * m * n


area = calculate_triangule_area(34, 24)

# Example 3: Returning a function
# Anonymous Functions using Lambda Calculus
# The input and/or output can be a function: this is called High Order Function
university = lambda name: print("My University: ", name)
university("USACH")

# Pure Functions
# Example 1: Impure

my_lst = [1, 2, 3]


def add_element(number):
    my_lst.append(number)


add_element(4)
print(my_lst)

# Example 2: Pure, almost

my_lst = [1, 2, 3]


def add_element(lst, number):
    new_lst = lst.copy()
    new_lst.append(number)
    return new_lst


print(add_element(my_lst, 4))

# Example 3: Pure
print("Example 3: Pure Function")
my_lst = [1, 2, 3]


def add_element(lst, number):
    return [lst[0], lst[1], lst[2], number]


print(add_element(my_lst, 4))
