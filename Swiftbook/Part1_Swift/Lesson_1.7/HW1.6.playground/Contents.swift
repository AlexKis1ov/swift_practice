import UIKit

//: # Home Work 6

/*:
 ## Задание 1
 1.1 Создайте класс `Orange` со следующими свойствами:
 
 - `color: String`
 
 - `taste: String`
 
 - `radius: Double`
 
 Необходимо реализовать возможность создания экземпляра класса со значенями по умолчанию для свойств *color* и *taste*. Свойство *radius* должно быть обязательным для инициализации, т.е. не должно быть возможности создания экземпляра класса без радиуса.
 
 Объявите геттер *orangeVolume*, возвращающий объем апельсина. При этом расчет объема необходимо реализовать в методе *calculateOrangeVolume* (число Пи в Swift можно получить через константу `Double.pi`. Формулу расчета можно погуглить).
 
 Создайте экземпляр класса `Orange`, вызвав при этом инициализатор только для радиуса. Остальным свойствам, созданного экземпляра присвойте следующие значения:
 
 - `color` — *Orange*

 - `taste` — *Sweet*
 
 Выведите на консоль сообщение: «Orange has <...> color and <...> taste. The volume of orange is <...>», обращаясь к этим значениям через экземпляр класса.
 */

class Orange {
    
    var color: String
    var taste: String
    let radius: Double
    
    var orangeVolume: Double {
        calculateOrangeVolume()
    }
    
    init(color: String = "", taste: String = "", radius: Double) {
        self.color = color
        self.taste = taste
        self.radius = radius
    }
    
    private func calculateOrangeVolume() -> Double {
        4 / 3 * Double.pi * pow(radius, 3)
    }
}

let someOrange = Orange(radius: 95)
someOrange.color = "Orange"
someOrange.taste = "Sweet"

print("Orange has \(someOrange.color) color and \(someOrange.taste) taste. The volume of orange is \(someOrange.orangeVolume)")
 
/*:
 ## Задание 2
 2.1 Создайте класс `Shape` (родительский класс) со следующими свойствами:
 
 - `height: Float`
 
 - `width: Float`
 
 - `radius: Float`
 
 - `square: Float`
 
 - `perimeter: Float`
 
 Oбъявите в классе методы `squareOfShape` и `perimeterOfShape` для расчетов площади и периметра (длины) фигуры соответственно. Методы должены возвращать `Float`. Создайте отдельный инициализатор для высоты и ширины и отдельный инициализатор для радиуса. Так же создайте свойство `description`, которое должно возвращать сообщение следующего вида: «Площадь фигуры <тип фигуры> равна <... >, периметр (длина) равен(а) <...>»
 */

class Shape {
    
    var height: Float = 0
    var width: Float = 0
    var radius: Float = 0
    
    var square: Float {
        squareOfFigure()
    }
    
    var perimeter: Float {
        perimeterOfFigure()
    }
    
    var description: String {
        "Square of shape \(type(of: self)) is \(square). Perimeter - \(perimeter)"
    }
    
    init(height: Float, width: Float) {
        self.height = height
        self.width = width
    }
    
    init(radius: Float) {
        self.radius = radius
    }
    
    func perimeterOfFigure() -> Float {
        0
    }
    
    func squareOfFigure() -> Float {
        0
    }
}

/*:
 2.2. Создайте классы `Circle`, `Rectangle` и `Ellipse`, унаследовав их от `Shape`. Переопределите методы `squareOfShape` и `perimeterOfShape` для каждого класса в соответствии с правилом расчета площади и периметра (длины) конкретной фигуры.
 */

class Rectangle: Shape {
        
    override func squareOfFigure() -> Float {
        height * width
    }
    
    override func perimeterOfFigure() -> Float {
        (height + width) * 2
    }
}

class Circle: Shape {
    override func squareOfFigure() -> Float {
        Float.pi * radius * radius
    }
    
    override func perimeterOfFigure() -> Float {
        2 * Float.pi * radius
    }
}

class Ellipse: Shape {
    override func squareOfFigure() -> Float {
        Float.pi * height * width
    }
    
    override func perimeterOfFigure() -> Float {
        Float.pi * (height + width)
    }
}

//: 2.3 Создайте по экземпляру каждого класса, кроме `Shape` и проинициализируйте свойства `height` и `width` или `radius` для каждого класса в любые значения. Выведите значение свойства `description` на консоль.

let rectangle = Rectangle(height: 6, width: 9)
let circle = Circle(radius: 5)
let elipse = Ellipse(height: 10, width: 5)

print(rectangle.description)
print(circle.description)
print(elipse.description)
 
/*:
 ## Задание 3
 3.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:
 
 - `salary`
 
 - `name`
 
 - `surname`
 */

class Employee {
    
    let name: String
    let surname: String
    let salary: Int
        
    init(name: String, surname: String, salary: Int) {
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}
 
//: 3.2 Создайте массив `names` со следующими именами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` со следующими фамилиями: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*. Массивы должны быть созданы вне класса.

let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]

//: 3.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*

var employees: [Employee] = []

for _ in 1...10 {
        
    let employee = Employee(
        name: names.randomElement() ?? "",
        surname: surnames.randomElement() ?? "",
        salary: Int.random(in: 1000...2000)
    )
    
    employees.append(employee)
}

//: 3.4 Переберите массив `employees` и выведите информацию по каждому сотруднику в виде: «<имя> <фимилия>’s salary is $<... >»

for employee in employees {
    print("\(employee.name) \(employee.surname)’s salary is $\(employee.salary)")
}

//: 3.5 Создайте еще один массив на основе `employees`, который включает только тех работников, чья зарплата чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 3.4

var employeesWithEvenSalary: [Employee] = []

for employee in employees {
    if employee.salary.isMultiple(of: 2) {
        employeesWithEvenSalary.append(employee)
    }
}

print("\n Сотрудники с четной зарплатой \n")

for employee in employeesWithEvenSalary {
    print("\(employee.name) \(employee.surname)’s salary is $\(employee.salary)")
}

print("\n Сотрудники с четной зарплатой \n")

employeesWithEvenSalary = employees.filter { $0.salary.isMultiple(of: 2) }

for employee in employeesWithEvenSalary {
    print("\(employee.name) \(employee.surname)’s salary is $\(employee.salary)")
} 
