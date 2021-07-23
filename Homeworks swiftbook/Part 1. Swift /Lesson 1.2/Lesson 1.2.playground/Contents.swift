//: ## Базовые операторы

import UIKit

//: ### Арифметические операторы:

var a = 9
var b = 4

a + b
a - b
a * b
a / b

//: ### Оператор остатка от деления:

a % b
-a % b
a % -b

//: ### Оператор присваивания:

a = 5
b = 10

a += b // a = a + b // a = 5 + 10 = 15
a -= b // a = a - b // a = 15 - 10 = 5
a *= b // a = a * b // a = 5 * 10 = 50
a /= b // a = a / b // a = 50 / 10 = 5

//: ### Операторы сравнения:

a == b // false
a != b // true
a > b // false
a < b // true
a >= b // false
a <= b // true

//: ### Оператор логического НЕ:

let accessDeniedMessage = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

var allowedEntry = false // Разрешение на вход отсутствует

if !allowedEntry {
    print(accessDeniedMessage)
} else {
    print(welcomeMessage)
}

//: ### Оператор логического И:

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    allowedEntry = true
    print(welcomeMessage)
} else {
    print(accessDeniedMessage)
}

//: ### Оператор логического ИЛИ:

let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    allowedEntry = true
    print(welcomeMessage)
} else {
    print(accessDeniedMessage)
}

// Комбинирование логических операторов
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    allowedEntry = true
    print(welcomeMessage)
} else {
    print(accessDeniedMessage)
}

//: ### Строки и символы:

let name: String
var surname = String()
var email = ""

name = "Алексей"
surname = "Ефимов"

var aboutCourse = """
Курс: "Основы программирования на Swift"
Количество уроков: 8
Уроков пройдено: 2
Уроков осталось: 6
Автор и ведущий курса: Алексей Ефимов
"""

print(aboutCourse)

//: ### Конкатенация строк:

let fullName = name + " " + surname
var myName = "My name is "

myName += fullName

//: ### Интерполяция строк

let numberOfLessons = 8
let lessonsCompleted = 2

aboutCourse = """
Курс: "Основы программирования на Swift"
Количество уроков: \(numberOfLessons)
Уроков пройдено: \(lessonsCompleted)
Уроков осталось: \(numberOfLessons - lessonsCompleted)
Автор и ведущий курса: \(fullName)
"""

let exclamationMark: Character = "!"

myName.append(exclamationMark)
