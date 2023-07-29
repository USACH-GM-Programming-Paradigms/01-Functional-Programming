owners = []


def register_owner(name, address):
    owners.append([name, address, []])  # third field is for pets


def register_pet(owner_name, pet_name, species, age):
    for owner in owners:
        if owner[0] == owner_name:
            owner[2].append(
                [pet_name, species, age]
            )  # append pet info to owner's pet list


def find_owner(name):
    for owner in owners:
        if owner[0] == name:
            return owner
    return None


def find_pet(owner_name, pet_name):
    for owner in owners:
        if owner[0] == owner_name:
            for pet in owner[2]:
                if pet[0] == pet_name:
                    return pet
    return None


def print_owners():
    for owner in owners:
        print(f"Owner: {owner[0]}, Address: {owner[1]}")
        for pet in owner[2]:
            print(f"Pet: {pet[0]}, Species: {pet[1]}, Age: {pet[2]}")


register_owner("John Doe", "123 Street")
register_pet("John Doe", "Rex", "Dog", 5)
register_owner("Jane Doe", "456 Street")
register_pet("Jane Doe", "Mittens", "Cat", 3)
print_owners()
