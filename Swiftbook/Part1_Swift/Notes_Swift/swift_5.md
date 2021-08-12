<!-- Урок 5. Функции -->

- [Функции](#функции)
	- [Функции с возвращаемыми значениями](#функции-с-возвращаемыми-значениями)
	- [Функция с параметрами без аргументов](#функция-с-параметрами-без-аргументов)
	- [Функция с парамтерами и аргументами](#функция-с-парамтерами-и-аргументами)
	- [Вариативные параметры функции](#вариативные-параметры-функции)
- [Замыкания](#замыкания)
	- [Замыкающие выражения](#замыкающие-выражения)
	- [Изпользование замыкания в качестве аргумента](#изпользование-замыкания-в-качестве-аргумента)
	- [Вывод типа из контекста](#вывод-типа-из-контекста)
	- [Неявные возвращаемые значения из замыканий с одним выражением](#неявные-возвращаемые-значения-из-замыканий-с-одним-выражением)
	- [Сокращенные имена параметров](#сокращенные-имена-параметров)
	- [Последующее замыкание](#последующее-замыкание)
	- [Операторные функции](#операторные-функции)
---
# Функции

Функция - блок кода с заданным именем, к которому можно обратиться в нужный момент

Функции позволяют избежать дублирования кода 

❗️ Название функций пишется camelCase с маленькой буквы - функция называется глаголом 

*Синтаксис:*
```
func nameOfFunction() {
	// some code
}
```

>Идельная функция - это одно действие

*Пример:*
```swift
func addingTwoNumbers() {
	let a = 10
	let b = 5
	print(a + b)
}

addingTwoNumbers() // вызов функции
```

❗️ Если свойство нужно только в одной функции, то инициализировать свойство нужно в области функции. Если свойство использует несколько функций, то инициализировать стоит вне области этих функций

`()` - в функции означает, что мы вызываем функцию

*Пример:*
```swift
func addingTwoNumbers() {
	let a = 10
	let b = 5
	print(a + b)
}

let result = addingTwoNumbers // копируем функцию в свойство, а не вызываем её!

addingTwoNumbers() // вызываем функцию
result() // вызов этой же функции
```

## Функции с возвращаемыми значениями
Такая фунция возвращает результат своей работы

*Синтаксис:*
```
func nameOfFunction() -> DataType {
	// some code
    return someValue
}
```



*Пример:*
```swift
func addingTwoNumbers() -> Int {
	let a = 10
	let b = 5
	return a + b
}

addingTwoNumbers() // 15
```

❗️ return - останавливает работу функции и возвращает значения в место вызова функции

❗️ В случае, если функция умещается в одну строку, слово return стоит опустить

## Функция с параметрами без аргументов

*Общий вид функции в коде:*
```swift
func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
    some code
}
```

**Характеристика:**
- Ограничения на кол-во параметров нет 
- Параметры видны в области функции

❗️ Лишних параметров в функции быть не должно. Параметры создаются и обязательно используются

*Пример:*
```swift
func addingTwoNumbers(a: Int, b: Int) -> Int {
	return a + b
}

addingTwoNumbers(a: 5, b: 10) // 15
```

❗️ Если фунция однострочная, то слово return не нужно:
```swift
func addingTwoNumbers(a: Int, b: Int) -> Int {
	a + b
}

addingTwoNumbers(a: 5, b: 10) // 15
```

## Функция с парамтерами и аргументами

Аргументы вводят для того, чтобы функции читались как предложения. Если есть аргументы, то параметры не читаются

*Пример:*
```swift
// number, andNumber - аргументы
func addingTwoNumbers(number a: Int, andNumber b: Int) -> Int {
	a + b
}

addingTwoNumbers(number: 5, andNumber: 10) // 15
```

❗️ Если функция самодостаточна по названию, то парамерты можно скрывать:
```swift
func addingTwoNumbers(_ a: Int, _ b: Int) -> Int {
	a + b
}

addingTwoNumbers(5, 10) // 15
```

> Параметры - это свойства, их стоит называть существительными
> 
> Аргументы - могут быть чем угодно, они нужны для правильной читаемости функции

❗️ На собеседовании смотрят на грамматические ошибки в коде и на названия функций

## Вариативные параметры функции

Вариативный параметр - параметр, который может иметь много значений, либо вообще не иметь параметров

```swift
// среднее арифметическое
func arithmeticMean(_ numbers: Double...) -> Double {
	var total = 0.0

	for number in numbers {
		total += number
	}

	return total / Double(numbers.count)
}

arithmeticMean(1, 3.14, -13, 0.0) // -2.215
```

❗️ Внутри функции вариативный параметр является массивом

# Замыкания 
> Дублировать код - плохо

Для понимания работы замыканий, нужно рассмотреть пример передачи функции в виде параметра в функцию

Реалезуем функцию в которую будем передавать другую функцию

Рассмотрим фунции отбора числа меньше заданного значения и больше заданного значения:

```swift
// Отбираем числа меньше заданного значения
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

// Отбираем числа больше заданного значения
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
```

2 эти фукнции отличаются друг от друга одним условием и **для экономии кода** мы можем условие проверять отдельными функциями 

```swift
// Функция для отбора чисел, относительно заданного значения
func filterWithPredicateClosure(value: Int, numbers: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    var filterNumbers: [Int] = []

    for number in numbers {
        if closure(number, value) {
            filterNumbers.append(number)
        }
    }
    return filterNumbers
}

// функция сравнения
func lesThanValue(number: Int, value: Int) -> Bool {
    number < value
}

// функция сравнения 
func greaterThanValue(number: Int, value: Int) -> Bool {
    number > value
}
```

Теперь, передавая функции сравнения в функцию фильтрации массива, можно менять поведение функции

```swift 
filterWithPredicateClosure(value: 5, numbers: numbers, closure: lesThanValue) 
// [1, 4, 3]

filterWithPredicateClosure(value: 5, numbers: numbers, closure: greaterThanValue) 
// [8, 20, 13, 6]
```

## Замыкающие выражения
Замыкающие выражения - это безымянные функции, которые написаны в облегченном синтаксисе, которые могут захватывать значения из окружающего контекста

*Пример:*
```
{ (параметры) -> тип результата in
    тело замыкающего выражения
}
```

## Изпользование замыкания в качестве аргумента

```swift
// Отбор чисел меньше указанного значения
filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        return number < value
}) 
// [1, 4, 3]


// Отбор чисел больше указанного значения
filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        return number > value
}) 
// [8, 20, 13, 6]
```

## Вывод типа из контекста

Не обязательно Дублировать информацию о типах параметров и возвращаемого значения

Сигнатура замыкания определена в родительской функции, тип явно указывать не нужно:

`func filterWithPredicateClosure(... closure: (Int, Int) -> Bool)`

```swift
filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in
        return number < value
})
// [1, 4, 3]

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in
        return number > value
})
// [8, 20, 13, 6]
```

## Неявные возвращаемые значения из замыканий с одним выражением

Если замыкание содержет в теле всего одно выражение и возарщает его через `ruturn`, то ключевое слово можно опустить

```swift
filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in number < value }
)
// [1, 4, 3]

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in number > value }
)
// [8, 20, 13, 6]
```

## Сокращенные имена параметров

Для однострочных замыканий swift предоставляет возможность быстрого доступа (по индексу) к парамертам, передаваемым в замыкание

❗️ При создании функции с параметрами, замыкание следует объявлять последним параметром, 

```swift
filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { $0 < $1 } // $0 - number, $1 - value
)
// [1, 4, 3]

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { $0 > $1 } // $0 - number, $1 - value
)
// [8, 20, 13, 6]
```

## Последующее замыкание

Если замыкание в качестве параметра стоит последним, то swift позволяет вынести это замыкание за скобки, опустив имя замыкания

```swift
filterWithPredicateClosure(value: 5, numbers: numbers) { $0 < $1 } // [1, 4, 3]
filterWithPredicateClosure(value: 5, numbers: numbers) { $0 > $1 } // [8, 20, 13, 6]
```

## Операторные функции

Для замыкания можно использовать операторные-функции

```swift
filterWithPredicateClosure(value: 5, numbers: numbers, closure: <) // [1, 4, 3]
filterWithPredicateClosure(value: 5, numbers: numbers, closure: >) // [8, 20, 13, 6]
```