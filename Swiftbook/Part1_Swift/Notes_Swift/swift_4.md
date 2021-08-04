<!-- Урок 4. Типы коллекций. Циклы -->
- [Типы коллекций](#типы-коллекций)
  - [Массивы](#массивы)
  - [Множетсва](#множетсва)
  - [Словари](#словари)
  - [Использование логического свойства isEmpty](#использование-логического-свойства-isempty)
- [Циклы](#циклы)
  - [For-in](#for-in)
  - [While](#while)
    - [Repeat-while](#repeat-while)
---
# Типы коллекций

## Массивы

Хранят в себе упорядоченные, но при этом не уникальные значения одного типа

- Хранятся значения одного типа
- Значения массивов могут быть не уникальными
- Все элементы упорядочены (есть индексы)

❗️ Не использовать в именовании массивов слово "array"

```swift
// Неизменяемый массив с типом данных String
let strings = ["a", "b", "c"]

// Неизменяемый массив с типом данных Character
let characters: [Character] = ["a", "b", "c"]

// Пустой массив с типом Int
var integers = [Int]()
var anotherIntegers: [Int] = []

// Присваивание данных массиву
integers = [1, 2, 3]

// Присвоение новых данных в массив
integers = [4, 5, 6]

// Добавление новых значений к уже существующим
integers += [7, 8]

// Добавление нового значения при помощи метода append
integers.append(9)

// Добавление нового элемента по индексу
integers.insert(1, at: 0)

// Создание нового массива, путём объединения двух других массивов
let someIntegers = [12, 17]

anotherIntegers = integers + someIntegers

// Удаление последнего элемента из массива и сохранение его в константе
let lastValue = anotherIntegers.removeLast()

// Удаление первого элемента из массива и сохранение его в константе
let firstValue = anotherIntegers.removeFirst()

// Удаление значения по индексу
anotherIntegers.remove(at: 1)

// Количество элементов массива
anotherIntegers.count

// Удаление всех элементов массива
anotherIntegers.removeAll()

// Обнуление массива путём присваивания ему пустого массиву
integers = []

// Замена значения по индексу 2 на новое значение
integers = [10, 20, 40]
integers[2] = 30
```

## Множетсва

Хранят в себе неупорядоченные, но при этом уникальные значения одного типа

- Не имеют индексов (быстрее массивов)
- Элементы хранятся в рандомном порядке (нет индексов)
- Элементы уникальные

```swift
// Создание пустого множества
var characters: Set<Character> = [] // <- Используем эту
var integers = Set<Int>()

// Создание множества с типом стринг
var strings: Set = ["a", "b", "c", "c", "c", "d"]

// Добавление нового элемента в множество
strings.insert("f")

// Проверка на наличие определенного элемента во множестве
strings.contains("b")

// Сортировка с использованием метода sorted() для последующей итерации по множеству
let newStrings = strings.sorted(by: >) 
```
❗️ Метод sorted() возвращает массив

## Словари

Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа

- Элементы в рандомном порядке (нет индексов)
- Элементы ключ-значение могут быть различных друг от друга типов
- Сами ключи и значения элементов должны быть одного типа

```swift
var someStringDictionary = Dictionary<String, String>() //Полная форма записи словаря
var morStringDictionary: Dictionary<String, String> = [:]
var anotherSomeDictionary = [Int: String]() // Сокращенная форма записи словаря
var carWashQueue: [String: String] = [:] // <- Используем эту

// Наполнение словаря данными
carWashQueue = ["E095BA": "Red Toyota", "X127MT": "White BMW X6"]

// Изменение значения для ключа
carWashQueue["E095BA"] = "Red Camry"

// Изменение значения с сохранением старого значения
carWashQueue.updateValue("Gray BMW X6", forKey: "X127MT")

// Добавление новой пары ключ-значение
carWashQueue["M567PA"] = "Green Niva"

carWashQueue

// Удаление значения по ключу с сохранением значения
carWashQueue.removeValue(forKey: "E095BA")
carWashQueue["X127MT"] = nil

// Кол-во пар ключ/значение в словаре
carWashQueue.count

// Полная очистка словаря
carWashQueue.removeAll()
carWashQueue = [:]
```

## Использование логического свойства isEmpty
```swift
if !integers.isEmpty {
    print(integers)
}
```
Работает со всеми коллекциями

# Циклы

## For-in 

- Перебор любых видов коллекций
- Один проход цикла - это итерация

```swift
for counter in lower…upper {
    some code
}
```


❗️ Имя свойства counter следует давать в единственном числе относительно имени коллекции

*Перебор диапазона:*
```swift
for _ in 1...5 {
    print("Hello!")
}
```

*Итерация по массиву:*
```swift
let fruits = [
    "apple",
    "banana",
    "pineapple",
    "apple",
    "pear",
    "apple",
    "plum",
    "apricot",
    "apple"
]

var appleCount = 0

for fruit in fruits {
    if fruit == "apple" {
        appleCount += 1
    }
}

print(appleCount) // 4
```

*Перебор словаря:*
```swift
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
```

*Перебор текста:*
```swift
let text = "Hello!"

for char in text {
    print(char)
}
```

## While 
*Синтаксис*
```swift 
while condition {
    some code
}
```
*Пример*
```swift
var counter = 5

while counter > 0 {
    print(counter)
    counter -= 1
}
```

### Repeat-while

В таком варианте сначала выпоняется одна интерация, после происходит проверка условия

*Пример*
```swift
repeat {
    print(counter)
    counter -= 1
} while counter > 5
```

