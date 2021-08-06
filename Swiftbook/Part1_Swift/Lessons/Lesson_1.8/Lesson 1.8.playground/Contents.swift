import UIKit

//: # Lesson 8

//: # Дополнительные коцепции Swift

//: ## Кортежи

/*:
 
    (valueOne, ValueTwo, ValueThree,…)

*/


class Weather {
    var currentWeather: (Int, String)
    
    init(currentWeather: (Int, String)) {
        self.currentWeather = currentWeather
    }
}

let weather = Weather(currentWeather: (22, "Sunny"))
weather.currentWeather

//: ### Получение доступа к элементам

weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"

weather.currentWeather

let (temperature, _) = weather.currentWeather
temperature
//atmos

//: ### Именование элементов кортежа

let currentWeather = (temp: 22, atmos: "Sunny", windSpeed: 6)
currentWeather.temp
currentWeather.atmos
currentWeather.windSpeed


//: ### Массовое присвоение значений

var numberOne = 1
var numberTwo = 2
var numberThree = 3

(numberOne, numberTwo, numberThree) = (4, 5, 6)

var cityTemp = [
    "Moscow": Int.random(in: 25...31),
    "Ufa": Int.random(in: 25...35),
    "S-Pb": Int.random(in: 16...25)
]

for (city, temp) in cityTemp {
    print("Температура в городе \(city) составляет \(temp) градусов")
}

let cityList = cityTemp.sorted(by: <)

for cityTemp in cityList {
    print("\(cityTemp.key) \(cityTemp.value)")
}

func getTemp(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: 16...36)
    return (city, temp)
}

let (city, temp) = getTemp(in: "Ufa")
print("Температура в городе \(city) составляет \(temp) градусов")

let tempInCity = getTemp(in: "Moscow")
print("Температура в городе \(tempInCity.city) составляет \(tempInCity.temp) градусов")

//: ## Guard

var name = ""
var surname = ""
var email = ""
var age = 0

func createNewUserV1(name: String, surname: String, email: String, age: Int) {
    if name != "" {
        print(name)
    } else {
        print("Enter your name")
    }
    
    if surname != "" {
        print(surname)
    } else {
        print("Enter your surname")
    }
    
    if email != "" {
        print(email)
    } else {
        print("Enter your email")
    }
    
    if age >= 18 {
        print(age)
    } else {
        print("Entry for adults only")
    }
    
    print("\(name) \(surname), Welcome!")
}

name = "Tim"

createNewUserV1(name: name, surname: surname, email: email, age: age)

func createNewUserV2(name: String, surname: String, email: String, age: Int) {
    if name != "" {
        print(name)
        if surname != "" {
            print(surname)
            if email != "" {
                print(email)
                if age >= 18 {
                    print("\(name) \(surname), Welcome!")
                } else {
                    print("Entry for adults only")
                }
            } else {
                print("Enter your email")
            }
        } else {
            print("Enter your surname")
        }
    } else {
        print("Enter your name")
    }
}

surname = "Cook"
email = "timcook@apple.com"
age = 18

createNewUserV2(name: name, surname: surname, email: email, age: age)

func createNewUserV3(name: String, surname: String, email: String, age: Int) {
    if name == "" {
        print("Enter your name")
        return
    }
    
    print(name)
    
    if surname == "" {
        print("Enter your surname")
        return
    }
    
    print(surname)
    
    if email == "" {
        print("Enter your email")
        return
    }
    
    print(email)
    
    if age < 18 {
        print("Entry for adults only")
        return
    }
    
    print("\(name) \(surname), Welcome!")
}

age = 18

createNewUserV3(name: name, surname: surname, email: email, age: age)

func createNewUserV4(name: String?, surname: String?, email: String?, age: Int?) {
    if name == nil, name?.count == 0 {
        print("Enter your name")
        return
    }
    
    print(name!)
    
    if surname == nil, surname?.count == 0  {
        print("Enter your surname")
        return
    }
    
    print(surname!)
    
    if email == nil, email?.count == 0  {
        print("Enter your email")
        return
    }
    
    print(email!)
    
    if age == nil, age! < 18  {
        print("Entry for adults only")
        return
    }
    
    print("\(name!) \(surname!), Welcome!")
}


//: ### Синтаксис

/*:

    guard condition else { return }

 */

func createNewUserV5(name: String?, surname: String?, email: String?, age: Int?) {
    guard let name = name, !name.isEmpty else { return }
    guard let surname = surname, !surname.isEmpty else { return }
    guard let email = email, !email.isEmpty else { return }
    guard let age = age, age >= 18 else {
        print("Entry for adults only")
        return
    }
    
    print("\(name) \(surname), Welcome!")
}

class Person {
    var id: String?
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var buildingNumber: String?
    var streetName: String?
    var apartmentNumber: String?
}

var person: Person?

if let residence = person?.residence {
    if let address = residence.address {
        if let apartmentNumber = address.apartmentNumber {
            print("The apartment number: \(apartmentNumber)")
        }
    }
}

// Опциональная последовательность

if let apartmentNumber = person?.residence?.address?.apartmentNumber {
    print("The apartment number: \(apartmentNumber)")
}

