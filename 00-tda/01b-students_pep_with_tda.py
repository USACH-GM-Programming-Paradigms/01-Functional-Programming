def make_student(name, subject, pep1, pep2, pep3):
    return [name, subject, pep1, pep2, pep3]


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
    student[0] = name


def set_student_subject(student, subject):
    student[1] = subject


def set_student_pep1(student, pep1):
    student[2] = pep1


def set_student_pep2(student, pep2):
    student[3] = pep2


def set_student_pep3(student, pep3):
    student[4] = pep3


# Create student
student = make_student("Gonzalo", "Paradigmas", 7, 6, 3)
print(student)

# Change PEP 1 grade to 4
set_student_pep1(student, 4)
print(student)

# System is a student records system

# Register students
students = []
students.append(student)
print(students)

# Change name of the student
set_student_name(student, "Gonzalo Martinez")

print(students)
