<!-- Урок 3. Условные инструкции. Опциональные типы данных -->

- [Условные конструкции](#условные-конструкции)
  - [Конструкция if](#конструкция-if)
  - [Конструкция if-else](#конструкция-if-else)
  - [Тренарный оператор](#тренарный-оператор)
  - [Switch](#switch)
---
# Условные конструкции

## Конструкция if 
*Общий вид*
```swift
if condition {
    // some code
}
```

❗️ CTRL + I позволяет корректно выставлять табуляции, если код поехал

## Конструкция if-else
```swift
if condition {
    // code
} else {
    // code
}
```
Если условие не подходит под `if`, то выполняется блок `else`

❗️ Не стоит всегда создавать конечный else, ставить его стоит в том случае, если он нужен

Вместо нескольких if можно условия писать через запятую
```swift
if 1 < 2 {
    if 2 < 3 {
        print(true) // true
    }
}

if 1 < 2, 2 < 3 {
    print(true) // true
}
```

## Тренарный оператор 
*Общий вид*
```swift
condition ? trueCondition : falseCondition
```

*Пример* 
```swift
let a = 5
let b = 10

a < 10 ? print("The condition is true") : print("The condition is false") // "The condition is true"

c = a < 10 ? a - b : a + b // -5
```
❗️ Тернарый оператор можно использовать, если в условных блоках 1 строка кода

## Switch

❗️ В свифт кейс default должен быть определен по умолчанию (без него нельзя)

```
switch значение для сопоставления {
case значение 1:
    инструкция для первого значения
case значение 2, значение 3:
    инструкция для второго и третьего значения
default:
    инструкция, если совпадений с шаблонами не найдено
}
```

*Пример*
```swift
var someCharacter: Character = "a"

switch someCharacter {
case "a", "A":
    print("Is an A") // Is an A
case "b", "B":
    print("Is an B") // не выполняется
case "c", "C":
    print("Is an C") // не выполняется
default:
    print("Don't know what is it") // не выполняется
}
```

Соответсвие диапазону
```swift
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount = ""

switch approximateCount {
case ..<0:
    print("Error")
case 0:
    naturalCount = "zero"
case 1:
    naturalCount = "one"
case 2..<5:
    naturalCount = "a few"
case 5...11:
    naturalCount = "several"
case 12...99:
    naturalCount = "dozens of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)") // naturalCount =  dozens of
```
