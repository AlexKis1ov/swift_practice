<!-- Урок 3. Условные инструкции. Опциональные типы данных -->
# Условные конструкции

## Конструкция if 
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

## Тренарный оператор 
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