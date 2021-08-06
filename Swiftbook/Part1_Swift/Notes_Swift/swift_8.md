<!-- Урок 8. Дополнительные концепции Swift -->

- [Кортежи](#кортежи)
  - [Доступ к элементам кортежа](#доступ-к-элементам-кортежа)
  - [Именование элеметов кортежа](#именование-элеметов-кортежа)
  - [Массовое присвоение значений](#массовое-присвоение-значений)
- [Оператор Guard](#оператор-guard)
  - [Извлечение опационального значения](#извлечение-опационального-значения)
---

# Кортежи
Кортеж (tuple) - это объект, который группирует значения различных типов в пределах одного составного значения.

❗️ Не нужно делать большие кортежи, они созданы для 3-4 хранимых значений

Кортеж может быть как константой, так и переменной

*Примеры кортежей:*
```swift
let tuple = (10, "wow", true)
var tuple2 = (10, "wow", true)
```

## Доступ к элементам кортежа

Доступ к элементам производиться при помощи индексов (или имен элементов, если такие были установлены в кортеж)

*Пример доступа:*
```swift
let tuple = (10, "wow", true)
tuple.0 // 10
tuple.1 // wow
...
```

## Именование элеметов кортежа

Элементы кортежа (не обязательно все) можно именовать и обращаться к ним через имя 

*Пример:*
```swift
let currentWeather = (temp: 22, atmos: "Sunny", windSpeed: 6)
currentWeather.temp // 22
currentWeather.atmos // "Sunny"
currentWeather.windSpeed // 6
```

## Массовое присвоение значений

❗️ На практике так делать не нужно

```swift
var numberOne = 1
var numberTwo = 2
var numberThree = 3

(numberOne, numberTwo, numberThree) = (4, 5, 6)

numberOne // 4
numberTwo // 5
```

Кортежи позволяют присваивать знаячения в одну строку, НО ТАК ДЕЛАТЬ НЕ СТОИТ

Кортежи неявно используются для перебора коллекций

*Примеры:*
```swift
// Перебор словаря
let cityTemp = [
    "Moscow": Int.random(in: 25...31),
    "Ufa": Int.random(in: 25...35),
    "S-Pb": Int.random(in: 16...25)
]

for (city, temp) in cityTemp {
    print("Температура в городе \(city) составляет \(temp) градусов")
}

// Перебор массива
let array = [1, 2, 3]

for (index, element) in array.enumerated() {
    print(index, element)
}
```

Кортежи так же нужны, когда необходимо вернуть несколько значений из функции

*Пример:*
```swift
func getTemp(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: 16...36)
    return (city, temp)
}

let (city, temp) = getTemp(in: "Ufa")
print("Температура в городе \(city) составляет \(temp) градусов")
```

❗️ Рекомендуется именовать возвращаемые из функции параметры в кортеже

# Оператор Guard

Оператор guard называется оператором досрочного выхода. Подобно оператору if, он проверяет истинность переданного ему условия. Отличие его в том, что он выполняет код в теле оператора только в том случае, если условие вернуло значение false.

Используется, когда необходимо гарантировать, что тестируемое выражение будет выполнено (вернет true), в противном случае код после оператора выполнен не будет и произойдет выход из текущей области видимости (завершится функция, прервется выполнение цикла и др.). В большинстве случаев позволяет избежать многоуровневых вложенностей и сделать код более читабельным и простым
в обслуживании.

❗️ При использовании guard подразумевается, что будет использовано ключевое слово return 

Задача: проверить параметры функции на наличие строк, а не пустой строки и выводить поочередно проверенные параметры в консоль

*Пример без guard:*
```swift
func createNewUserV1(name: String, surname: String, email: String) {
    if name != "" {
        print(name)
        if surname != "" {
            print(surname)
            if email != "" {
                print(email)
            } else {
                print("Enter your email")
                return
            }
        } else {
            print("Enter your surname")
            return
        }
    } else {
        print("Enter your name")
        return
    }
}


createNewUserV1(name: "Igor", surname: "", email: "lexemz")
// >Igor
// >Enter your surname
```

*Пример с guard:*
```swift
func createNewUserV2(name: String, surname: String, email: String) {
    guard name != "" else {
        print("Enter your email")
        return
    }
    guard surname != "" else {
        print("Enter your surname")
        return
    }
    guard email != "" else {
        print("Enter your email")
        return
    }
    
    print(email)
    print(surname)
    print(email)
}

createNewUserV2(name: "Igor", surname: "", email: "lexemz")
// >Enter your surname
```
*Пример извлечения опционалов и проверки строки на пустоту:*
```swift
func createNewUserV3(name: String?, surname: String?, email: String?, age: Int?) {
    guard let name = name, !name.isEmpty else { return }
    guard let surname = surname, !surname.isEmpty else { return }
    guard let email = email, !email.isEmpty else { return }
    guard let age = age, age >= 18 else {
        print("Entry for adults only")
        return
    }
    
    print("\(name) \(surname), Welcome!")
}
```

## Извлечение опационального значения

Наиболее часто используется для извлечения опционального значения, так как последующий код может использовать извлеченное значение. Если использовать оператор if, то значение будет доступно только в соответствующем блоке оператора

*Пример:*
```swift
func shapeAnalizator(shape: Shape) {
    // вариант с использованием if
    if let sides = shape.sides, sides > 2 {
        // sides доступна
    }
    // sides недоступна

    // вариант с использованием guard
    guard let sides = shape.sides, sides > 2 else {
        return
    }
    // sides доступна
}
```

