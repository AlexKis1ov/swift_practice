//: [Previous](@previous)

import Foundation


//: ## Множества
//: > Хранят в себе неупорядоченные, но при этом уникальные значения одного типа

// Создание пустого множества
var characters: Set<Character> = []
var integers = Set<Int>()

// Создание множества с типом стринг
var strings: Set = ["a", "b", "c", "c", "c", "d"]

// Добавление нового элемента в множество
strings.insert("f")

// Проверка на наличие определенного элемента во множестве
strings.contains("b")

// Сортировка с использованием метода sorted() для последующей итерации по множеству
let newStrings = strings.sorted(by: >)

//: [Next](@next)
