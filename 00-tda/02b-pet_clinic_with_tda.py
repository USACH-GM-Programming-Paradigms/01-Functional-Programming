# TDA Owner
# Type Owner = (name: String, address: String, pets: List[Pet])
# Owner functions


def make_owner(name, address):
    return [name, address, []]


def get_owner_name(owner):
    return owner[0]


def get_owner_address(owner):
    return owner[1]


def get_owner_pets(owner):
    return owner[2]


def set_owner_name(owner, name):
    owner[0] = name


def set_owner_address(owner, address):
    owner[1] = address


def add_owner_pet(owner, pet):
    owner[2].append(pet)


# TDA Pet
# Type Pet = (name: String, species: String, age: Int)


# Pet functions
def make_pet(name, species, age):
    return [name, species, age]


def get_pet_name(pet):
    return pet[0]


def get_pet_species(pet):
    return pet[1]


def get_pet_age(pet):
    return pet[2]


def set_pet_name(pet, name):
    pet[0] = name


def set_pet_species(pet, species):
    pet[1] = species


def set_pet_age(pet, age):
    pet[2] = age


# TDA Sytem
# Type System = List[Owner]

# System functions

system = []


def register_owner(name, address):
    system.append(make_owner(name, address))


def register_pet(owner_name, pet_name, species, age):
    for owner in system:
        if get_owner_name(owner) == owner_name:
            add_owner_pet(owner, make_pet(pet_name, species, age))


def print_owners():
    for owner in system:
        print(f"Owner: {get_owner_name(owner)}, Address: {get_owner_address(owner)}")
        for pet in get_owner_pets(owner):
            print(
                f"Pet: {get_pet_name(pet)}, Species: {get_pet_species(pet)}, Age: {get_pet_age(pet)}"
            )


register_owner("John Doe", "123 Street")
register_pet("John Doe", "Rex", "Dog", 5)
register_owner("Jane Doe", "456 Street")
register_pet("Jane Doe", "Mittens", "Cat", 3)
print_owners()
