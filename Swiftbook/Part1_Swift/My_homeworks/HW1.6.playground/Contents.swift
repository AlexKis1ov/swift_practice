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
	var color: String = "Orange"
	var taste: String = "Sweet"
	let radius: Double
	var orangeVolume: Double {
		calculateOrangeVolume(radius)
	}

	init(radius: Double) {
		self.radius = radius
	}

	func calculateOrangeVolume(_ radius: Double) -> Double {
		4 / 3 * Double.pi * pow(radius, 3)
	}
}

let myOrange = Orange(radius: 4)

print("Orange has \(myOrange.color) color and \(myOrange.taste) taste. The volume of orange is \(myOrange.orangeVolume)\n")

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
		squareOfShape()
	}
	var perimeter: Float {
		perimeterOfShape()
	}
	var description: String {
		"Площадь фигуры \(type(of: self)) равна \(square), периметр (длина) равен(а) \(perimeter)"
	}

	init(height: Float, width: Float) {
		self.height = height
		self.width = width
	}

	init(radius: Float) {
		self.radius = radius
	}

	func squareOfShape() -> Float {
		0
	}

	func perimeterOfShape() -> Float {
		0
	}
}

/*:
 2.2. Создайте классы `Circle`, `Rectangle` и `Ellipse`, унаследовав их от `Shape`. Переопределите методы `squareOfShape` и `perimeterOfShape` для каждого класса в соответствии с правилом расчета площади и периметра (длины) конкретной фигуры.
 */
class Circle: Shape {
	override func squareOfShape() -> Float {
		Float.pi * pow(radius, 2)
	}

	override func perimeterOfShape() -> Float {
		2 * Float.pi * radius
	}
}

class Rectangle: Shape {
	override func squareOfShape() -> Float {
		height * width
	}

	override func perimeterOfShape() -> Float {
		(height + width) * 2
	}
}

class Ellipse: Shape {
	override func squareOfShape() -> Float {
		Float.pi * (height / 2) * (width / 2)
	}

	override func perimeterOfShape() -> Float {
		2 * Float.pi * sqrt((pow(width, 2) + pow(height, 2)) / 8)
	}
}

//: 2.3 Создайте по экземпляру каждого класса, кроме `Shape` и проинициализируйте свойства `height` и `width` или `radius` для каждого класса в любые значения. Выведите значение свойства `description` на консоль.
let myCircle = Circle(radius: 5)
let myRectangle = Rectangle(height: 10, width: 5)
let myEllipse = Ellipse(height: 10, width: 20)

print(myCircle.description)
print(myRectangle.description)
print(myEllipse.description)
/*:
 ## Задание 3
 3.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:

 - `salary`

 - `name`

 - `surname`
 */
class Employee {
	let salary: Int
	let name: String
	let surname: String

	init(salary: Int, name: String, surname: String) {
		self.salary = salary
		self.name = name
		self.surname = surname
	}
}

//: 3.2 Создайте массив `names` со следующими именами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` со следующими фамилиями: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*. Массивы должны быть созданы вне класса.
let names = [
	"John",
	"Aaron",
	"Tim",
	"Ted",
	"Steven"
]
let surnames = [
	"Smith",
	"Dow",
	"Isaacson",
	"Pennyworth",
	"Jenkins"
]
//: 3.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*
var employees: [Employee] = []

for _ in 1...10 {
	employees.append(Employee(
		salary: Int.random(in: 1000...2000),
		name: names.randomElement()!,
		surname: surnames.randomElement()!
	))
}

//: 3.4 Переберите массив `employees` и выведите информацию по каждому сотруднику в виде: «<имя> <фимилия>’s salary is $<... >»
func printEmployeeInfo(of employees: [Employee]) {
	print()
	for employee in employees {
		print("\(employee.name) \(employee.surname) salary is \(employee.salary)$")
	}
}

printEmployeeInfo(of: employees)
//: 3.5 Создайте еще один массив на основе `employees`, который включает только тех работников, чья зарплата чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 3.4
let evenSalaryEmployees = employees.filter { $0.salary % 2 == 0 }

printEmployeeInfo(of: evenSalaryEmployees)
