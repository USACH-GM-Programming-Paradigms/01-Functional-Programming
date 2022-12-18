# Currying en Python - Many to Single Argument

# Dom: number x number x number x number x number
# Rec: void
def imprimir(a):
    def w(b):
        def x(c):
            def y(d):
                def z(e):
                    print(a, b, c, d, e)

                return z

            return y

        return x

    return w


imprimir(10)(20)(30)(40)(50)
