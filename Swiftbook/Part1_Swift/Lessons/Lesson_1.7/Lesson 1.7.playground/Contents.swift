import UIKit

//: # Lesson 7

//: ## Перечисления

var someDay = "Monday"

func setupAlarm(for day: String) {
    if day == "Monday" || day == "Tuesday" {
        print("Today is \(day). The alarm is set at 8 a.m.")
    } else {
        print("Today is \(day). Alarm no set")
    }
}

setupAlarm(for: someDay)

someDay = "tuesday"

setupAlarm(for: someDay)

/*:
    enum EnumerationName {
        case enumeration
    }
 
 */

enum Weekday {
    case monday
    case tuesday
    case wednsday
    case thursday
    case friday
    case saturday
    case sunday
}

//: ### Использование инструкции Switch

var weekday = Weekday.tuesday
weekday = .monday

func setupAlarm(for weekday: Weekday) {
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

//: ### Исходные значения

enum Countries: String {
    case usa = "USA"
    case russia = "Russia"
    case china
}

var country = Countries.russia
print("case name: \(country)")
print("case value: \(country.rawValue)")

country = .china

print("case name: \(country)")
print("case value: \(country.rawValue)")

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earth = Planet.earth
print("Earth is the \(earth.rawValue) from the sun")

//: ### Инициализация

if let possiblePlanet = Planet(rawValue: 7) {
    print("The seventh planet is \(possiblePlanet)")
}

//: ### Связанные значения (ассоциированные параметры)

enum WeekdayV2 {
    case workday(message: String, time: Int)
    case weekend(message: String)
}

var anyDay = WeekdayV2.workday(message: "Set alarm to", time: 8)

func setAlarm(for weekday: WeekdayV2) {
    switch weekday {
    case let .workday(message, time):
        print("\(message) \(time) a.m.")
    case let .weekend(message):
        print(message)
    }
}

setAlarm(for: anyDay)

anyDay = .weekend(message: "Have a nice weekend!")

setAlarm(for: anyDay)

//: ## Структуры

let playerOne = "Player One"
var player1XPosition = 10
var player1YPosition = 5

let playerTwo = "Player Two"
var player2XPosition = 8
var player2YPosition = 3

func getPlayerPosition(for player: String, x: Int, y: Int) {
    print("The position of \(player): X\(x):Y\(y)")
}

getPlayerPosition(for: playerOne, x: player1XPosition, y: player1YPosition)
getPlayerPosition(for: playerTwo, x: player2XPosition, y: player2YPosition)

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

playerOnePosition.player
playerOnePosition.x = 7
playerOnePosition.y
playerOnePosition.getPlayerPosition()

/*:
    struct StructureName {
        var nameOfVarioable: DataType
        func someFunction {
            some code
        }
    }
 
 */



//: ### Сравение классов и структур

class MacBook {
    var name: String
    var year: Int
    var color: String
    
    init(name: String, year: Int, color: String) {
        self.name = name
        self.year = year
        self.color = color
    }
    
    func printDescription() {
        print("\(name) \(year) \(color)")
    }
}

let macBookPro = MacBook(name: "MacBook Pro", year: 2021, color: "Space Gray")

let macBookAir = macBookPro
macBookAir.name = "MacBook Air"

macBookPro.printDescription()
macBookAir.printDescription()

struct IPhone {
    var name: String
    var color: String
    var capacity: Int
    
    func printDescription() {
        print("\(name) \(color) \(capacity)Gb")
    }
}

let iPhoneXR = IPhone(name: "iPhone XR", color: "Coral", capacity: 128)

var iPhone12 = iPhoneXR
iPhone12.name = "iPhone 12"

iPhoneXR.printDescription()
iPhone12.printDescription()

var someNumber = 12
var anyNumber = someNumber

someNumber = 0
anyNumber

//: ### Методы в структурах

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
rectangle.area
rectangle.scale(width: 2, height: 3)
