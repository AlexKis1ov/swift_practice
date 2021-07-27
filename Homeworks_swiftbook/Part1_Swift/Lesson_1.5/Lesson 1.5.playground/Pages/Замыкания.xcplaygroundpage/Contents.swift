//: [Previous](@previous)

import Foundation

//: ### Функции как замыкания


//: Отбираем числа меньше заданного значения


func filterLesThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredSetOfNumbers: [Int] = []

    for number in numbers {
        if number < value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

let numbers = [5, 8, 20, 13, 1, 4, 3, 6]

filterLesThanValue(value: 5, numbers: numbers)


//: Отбираем числа больше заданного значения


func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredSetOfNumbers: [Int] = []

    for number in numbers {
        if number > value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

filterGreaterThanValue(value: 5, numbers: numbers)

//: Функция для отбора чисел, относительно заданного значения


func filterWithPredicateClosure(value: Int, numbers: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    var filterNumbers: [Int] = []

    for number in numbers {
        if closure(number, value) {
            filterNumbers.append(number)
        }
    }
    return filterNumbers
}


//: Функция для отбора числе меньше указанного значения

func lesThanValue(number: Int, value: Int) -> Bool {
    number < value
}

//: Функция для отбора числе больше указанного значения

func greaterThanValue(number: Int, value: Int) -> Bool {
    number > value
}

//: Отбор чисел меньше указанного значения

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: lesThanValue
)

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: greaterThanValue
)

//: ### Замыкающие выражения

/*:
 
Замыкающие выражения - это безымянные функции, которые написаны в облегченном синтаксисе, которые могут захватывать значения из окружающего контекста
 
 */


/*:
    { (параметры) -> тип результата in
        тело замыкающего выражения
    }
 */


/*:
 Изпользование замыкания в качестве аргумента
 
 Отбор чисел меньше указанного значения
 */

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        return number < value
})


//: Отбор чисел больше указанного значения

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        return number > value
})


//: Вывод типа из контекста

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in
        return number < value
})

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in
        return number > value
})


//: Неявные возвращаемые значения из замыканий с одним выражением

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in number < value }
)

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in number > value }
)

//: Сокращенные имена параметров

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { $0 < $1 }
)

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { $0 > $1 }
)



//: Последующее замыкание

filterWithPredicateClosure(value: 5, numbers: numbers) { $0 < $1 }
filterWithPredicateClosure(value: 5, numbers: numbers) { $0 > $1 }

//: Операторные функции

filterWithPredicateClosure(value: 5, numbers: numbers, closure: <)
filterWithPredicateClosure(value: 5, numbers: numbers, closure: >)
