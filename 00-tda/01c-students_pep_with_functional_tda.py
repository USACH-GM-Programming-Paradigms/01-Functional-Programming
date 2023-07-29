# Student ADT


def make_student(name, subject, pep1, pep2, pep3):
    return (name, subject, pep1, pep2, pep3)


def get_student_name(student):
    return student[0]


def get_student_subject(student):
    return student[1]


def get_student_pep1(student):
    return student[2]


def get_student_pep2(student):
    return student[3]


def get_student_pep3(student):
    return student[4]


def set_student_name(student, name):
    return make_student(
        name,
        get_student_subject(student),
        get_student_pep1(student),
        get_student_pep2(student),
        get_student_pep3(student),
    )


def set_student_subject(student, subject):
    return make_student(
        get_student_name(student),
        subject,
        get_student_pep1(student),
        get_student_pep2(student),
        get_student_pep3(student),
    )


def set_student_pep1(student, pep1):
    return make_student(
        get_student_name(student),
        get_student_subject(student),
        pep1,
        get_student_pep2(student),
        get_student_pep3(student),
    )


def set_student_pep2(student, pep2):
    return make_student(
        get_student_name(student),
        get_student_subject(student),
        get_student_pep1(student),
        pep2,
        get_student_pep3(student),
    )


def set_student_pep3(student, pep3):
    return make_student(
        get_student_name(student),
        get_student_subject(student),
        get_student_pep1(student),
        get_student_pep2(student),
        pep3,
    )


# Functional System ADT


def make_system():
    return []


def get_system_students(system):
    return list(system)


def set_student_to_system(system, student):
    new_system = get_system_students(system)
    new_system.append(student)
    return new_system


# Using the Student ADT

# Create student
student = make_student("Gonzalo", "Paradigmas", 7, 6, 3)
print(student)

# Change PEP 1 grade to 4 (create new student record)
student = set_student_pep1(student, 4)
print(student)

# Register students
system_1 = [student]
print(system_1)

# Add new student to system
system_2 = set_student_to_system(system_1, make_student("John", "Paradigmas", 7, 6, 3))
print(system_2)
