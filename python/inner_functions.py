def outer_func(who):
    def inner_func():
        print(f"Hello, {who}")

    inner_func()


outer_func("World!")
