<!-- Урок 7. Структуры. Перечисления -->

- [Перечисления](#перечисления)
  - [Использование инструкции Switch](#использование-инструкции-switch)
  - [Исходные значения членов перечисления](#исходные-значения-членов-перечисления)
  - [Инициализатор enum](#инициализатор-enum)
  - [Ассоциативные параметры](#ассоциативные-параметры)
- [Структуры](#структуры)
  - [Методы в структурах](#методы-в-структурах)
---

# Перечисления
**Перечисление (enum)** — это объектный тип данных, который предоставляет до- ступ к различным предопределенным значениям. Рассматривайте его как пере- чень возможных значений, то есть набор констант, значения которых являются альтернативами друг другу.

❗️ Перечисление является value type, на него нельзя ссылаться 

Перечисления определяют набор коснтант, которые противоположны друг к другу по смыслу 

```
enum EnumerationName {
    case enumiration
}
```

- Кейсы - это константы (их значения должны быть уникальны относительно друг другу)
- Названия кейсов, а так же присваеваемые к кейсам значения так же должны быть уникальны 
- Если кейсу не присваивается значение, то значение кейса соотвсетсует названию кейса

❗️ Названия свойств - с маленькой буквы. Это относится и к кейсам перечислений

*Перечисление дней недели:*
```swift
enum Weekday {
    case monday
    case tuesday
    case wednsday
    case thursday
    case friday
    case saturday
    case sunday
}

// можно через запятую 
enum Weekday {
    case monday, tuesday, wednsday, thursday, friday, saturday, sunday
}
```

## Использование инструкции Switch

- Switch всегда используется для работы с перечислениями
- default ветка в switch при работе с перечислениями не обязательна

*Использование switch:*
```swift
// enum объявлен выше

var weekday = Weekday.tuesday // инициализация 
weekday = .monday

func setupAlarm(for weekday: Weekday) {
    // перебор кейсов перечисления Weekday
    switch weekday {
    case .monday:
        print("To set alarm at 8 am")
    case .tuesday:
        print("To set alarm at 8:30 am")
    case .wednsday:
        print("To set alarm at 8:30 am")
    case .thursday:
        print("To set alarm at 7:30 am")
    case .friday:
        print("Yay. TGIF!")
    default:
        print("Weekend, alarm not set")
    }
}

setupAlarm(for: weekday)
```

## Исходные значения членов перечисления

Кейсы могут содержать исходные значения, можно задать исходные значения некоторого типа данных (например, String, Character или Int). В результате вы получаете член перечисления и постоянно привязанное к нему значение.

Для задания исходных значений членов перечисления необходимо указать тип данных самого перечисления, соответствующий значениям членов, и определить значения для каждого отдельного члена перечисления

При создании экземпляра перечисления можно получить доступ к *исходному значению* члена этого экземпляра перечисления. Для этого используется свойство **rawValue**.

*Пример:*
```swift
enum Countries: String {
    case usa = "USA"
    case russia = "Russia"
    case china
}

var country = Countries.russia
print(country) // russia
print(country.rawValue) // Russia

country = .china

// Если кейсу не присваивается значение, то значение кейса соотвсетсует названию кейса
print(country) // china
print(country.rawValue)) // china 
```

Если в качестве типа данных перечисления указать Int, то исходные значения создаются автоматически путем увеличения значения на единицу для каждого по- следующего члена (значение первого члена равно 0). 

*Пример:*
```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earth = Planet.earth
print(earth.rawValue) // 3
```

## Инициализатор enum

Инициализатор используется для создания экземпляра перечисления с установленным конкретным значением

*Пример:*
```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let nilPlanet = Planet(rawValue: 10) // nil

if let possiblePlanet = Planet(rawValue: 7) {
    print(possiblePlanet) // uranus
}
```

## Ассоциативные параметры

У каждого из членов перечисления могут быть ассоциированные с ним значения, то есть его характеристики. Они указываются для каждого члена точно так же, как входящие аргументы функции, то есть в круглых скобках с указанием имен и типов, разделенных двоеточием. Набор ассоциированных параметров может быть уникальным для каждого отдельного члена.

В нагрузку к экземпляру перечисления мы добавляем значения

*Пример:*
```swift
enum WeekdayV2 {
    case workday(message: String, time: Int)
    case weekend(message: String)
}

// инициализация экземпляра
var anyDay = WeekdayV2.workday(message: "Set alarm to", time: 8)

func setAlarm(for weekday: WeekdayV2) -> String {

    // перебор перечисления
    switch weekday {

    // способ извлечения 1 - let пишется перед кейсом
    case let .workday(message, time):
        return "\(message) \(time) a.m."

    // способ извлечения 2 - let пишется перед каждым свойством
    case .weekend(let message):
        return message
    }
}

setAlarm(for: anyDay) // Set alarm to 8 a.m.

anyDay = .weekend(message: "Have a nice weekend!")

setAlarm(for: anyDay) // "Have a nice weekend!"
```
❗️ Способ извлечения ассоциированных параметров из перечисления в одном switch должен соответсвовать одному из способов, чередовать способы в одном swith запрещается!

# Структуры

Структуры, по сути, имеют логику работы как классы, но с кекоторыми отличиями
```
struct StructureName {
    var nameOfVarioable: DataType
    func someFunction {
        some code
    }
}
```

Отличия структур от классов 
- Структуры имеют встроенный инициализатор (при желании инициализатор можно переопределить)
- Отсутсвие наследования
- Структуры — это типы-значения (Value type), а класс является ссылочным типом (Reference type). При передаче экземпляра структуры от одного параметра в другой происходит его копирование.

*Пример структуры:*
```swift
struct PositionOnMap {
    let player: String
    var x: Int
    var y: Int
    
    func getPlayerPosition() {
        print("The position of \(player): X\(x):Y\(y)")
    }
}

var playerOnePosition = PositionOnMap(player: "Player One", x: 10, y: 8)
var playerTwoPosition = PositionOnMap(player: "Player Two", x: 3, y: 7)

playerOnePosition.player // "Player One"
playerOnePosition.x = 7 
playerOnePosition.y // 8
playerOnePosition.getPlayerPosition() // "The position of Player One: X7:Y8"
```

❗️ Если свойства структуры изменяются, то свойство должно быть переменной (var)

## Методы в структурах

Структры накладывают ограничение на работу собственных свойств с собственными методами

Методы (кроме инициализатора) не могут по умолчанию менять значения свойств, для этого перед ключевым словом `func` нужно поставить ключевое слово `mutating`

*Пример:*
```swift
struct Rectangle {
    var width: Int
    var height: Int
    
    var area: Int {
        width * height
    }
    
    mutating func scale(width: Int, height: Int) {
        self.width *= width
        self.height *= height
    }
}

var rectangle = Rectangle(width: 10, height: 5)
rectangle.area // 50
rectangle.scale(width: 2, height: 3)
rectangle.area // 300
```

❗️ Если экземпляр структуры хранится в константе, модификация его свойств невозможна. Если же он хранится в переменной, то возможна модификация тех свойств, которые объявлены с помощью оператора var.
