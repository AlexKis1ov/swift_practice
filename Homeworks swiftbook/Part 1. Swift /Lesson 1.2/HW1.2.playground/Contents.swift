import UIKit

//: # Home Work 2
/*:
 ## Задание 1
 1.1 Объявите два свойства с типом `Float` и присвойте им следующие значения: 3.14 и 42.0

 1.2 Присвойте результат сложения ваших свойств новому свойству с типом `Double`

 1.3 Выведите результат на консоль. Обратите внимание на значение результата.
 */

let pi: Float = 3.14
let someNumber: Float = 42.0
let newProperty = Double(pi) + Double(someNumber)

print(newProperty)

/*:
 ## Задание 2
 2.1 Создайте свойство `numberOne` и присвойте ему любое положительное целочисленное значение

 2.2 Создайте свойство `numberTwo` и присвойте ему любое положительное значение меньше `numberOne`

 2.3 Создайте свойство `result` и присвойте ему результат деления `numberOne` на `numberTwo`

 2.4 Создайте свойство `remainder` и присвойте ему остаток от деления `numberOne` на `numberTwo`

 2.5 Выведите на консоль фразу: «При делении <...> на <...> результат равен <...>, остаток равен <...>», подставив вместо (<...>) свои результаты.

 2.6 Выведите на консоль еще одну фразу: «Результат деления <...> на <...> равен <...> <...>/<...>». В математике результатом деления 5 на 3 будет натуральная дробь 1 2/3 (здесь мы используем стандартную математическую запись в тексте, а не оператор деления). На консоль необходимо вывести именно такой результат в виде натуральной дроби. Пример: «Результат деления 7 на 3 равен 2 1/3».
 */

let numberOne = 12
let numberTwo = 6
let result = numberOne / numberTwo
let remainder = numberOne % numberTwo

// Решение для Алексея
print("При делении \(numberOne) на \(numberTwo) результат равен \(result), остаток равен \(remainder)")
print("Результат деления \(numberOne) на \(numberTwo) равен \(result) \(remainder)/\(numberTwo)")

// Решение с правильной рационализацией дробного числа

// Функция для перевода иррационального числа к рациональному
// https://stackoverflow.com/questions/35895154/decimal-to-fraction-conversion-in-swift
func rationalApproximationOf(x0: Double, withPrecision eps: Double = 1.0E-6) -> (Int, Int) {
	var x = x0
	var a = floor(x)
	var (h1, k1, h, k) = (1, 0, Int(a), 1)

	while x - a > eps * Double(k) * Double(k) {
		x = 1.0 / (x - a)
		a = floor(x)
		(h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
	}
	return (h, k)
}

let ittational = Double(numberOne) / Double(numberTwo)
let resultTuple = rationalApproximationOf(x0: ittational)

print("Результат деления \(numberOne) на \(numberTwo) равен \(resultTuple.0 / resultTuple.1) \(resultTuple.0 - (resultTuple.1 * (resultTuple.0 / resultTuple.1)))/\(resultTuple.1)")
/*:
 ## Задание 3
 3.1 Объявите свойство `dayOfBirth` и присвоейте ему дату вашего рождения

 3.2 Объявите свойство `monthOfBirth` и присвоейте ему месяц вашего рождения

 3.3 Объявите свойство `yearOfBirth` и присвоейте ему год вашего рождения

 3.4 Необходимо рассчитать прожитое время с момента вашего рождения по текущую дату в разных единицах измерения (в годах, в месяцах, в днях и в секундах). За текущее время возьмите сегодняшнюю дату и 0 часов 0 минут. Високосные года учитывать не надо. Пусть среднее количество дней в месяце будет 30, а количество дней в году 360. Создайте все необходимые свойста, которые вам понадобятся для решения данной задачи. Для расчета всех необходимых величин используйте только арифметические операторы. Ни каких функций и условных операторов if-else использовать не нужно.

 3.5 Выведите результат вычислений на консоль в виде текста (n years, n months, n days and n seconds have passed since my birth). Пример: если я родился 9 ноября 1980 года, а текущая дата 29.01.20, то результат будет следующим: **39 years, 470 months, 14120 days and 1219968000 seconds have passed since my birth**.

 *3.6 Выведите на консоль сообщение о том в каком квартале вы родились. Для этого используейте операторы сравнения, что бы сравнить номер месяца вашего рождения с одним из четрырех кварталов. Например если номер месяца больше 0 и меньше или равно 3, то это будет первый квартал. Для получения результата используйте условный оператор if
 */

let dayOfBirth = 09
let monthOfBirth = 6
let yearOfBirth = 1999

let currentDay = 19
let currentMonth = 7
let currentYear = 2021

var lifeInDays = (currentYear - yearOfBirth) * 360 // кол-во лет в промежутке в днях
lifeInDays += (currentMonth - monthOfBirth) * 30 // кол-во месяцев в промежутке в днях
lifeInDays += currentDay - dayOfBirth // кол-во дней в промежутке в днях


let lifeInYears = lifeInDays / 360
let lifeInMonths = lifeInDays / 30
let lifeInSecs = lifeInDays * 86400

print("\(lifeInYears) years, \(lifeInMonths) months, \(lifeInDays) days and \(lifeInSecs) seconds have passed since my birth.")

if monthOfBirth >= 1, monthOfBirth <= 3 {
	print("Q1")
} else if monthOfBirth >= 4, monthOfBirth <= 6 {
	print("Q2")
} else if monthOfBirth >= 7, monthOfBirth <= 9 {
	print("Q3")
} else if monthOfBirth >= 10, monthOfBirth <= 12 {
	print("Q4")
} else {
	print("N/A")
}

/*:
 ### Задание 4
 Задание на вашу способность гуглить. Необходимо вычислить синус от числа 1 и округлить результат до тысячных. Для получания результата радианы искать не надо. Достаточно найти нужную функцию и она все сделает за вас.
 > Подсказка: в результате должно получиться 0.841
 */

let resultOfSin = round(sin(1.0) * 1000) / 1000
