import UIKit

//: # Home Work 2

/*:
 ## Задание 1
 1.1 Объявите два свойства с типом `Float` и присвойте им следующие значения: 3.14 и 42.0
 
 1.2 Присвойте результат сложения ваших свойств новому свойству с типом `Double`
 
 1.3 Выведите результат на консоль. Обратите внимание на значение результата.
 */
 
let floatOne: Float = 3.14
let floatTwo: Float = 42

let someDouble = Double(floatOne + floatTwo)
//let someDouble = Double(floatOne) + Double(floatTwo)

print("Сумма \(floatOne) и \(floatTwo) равна \(someDouble)")

/*:
 ## Задание 2
 2.1 Создайте свойство `numberOne` и присвойте ему любое положительное целочисленное значение
 
 2.2 Создайте свойство `numberTwo` и присвойте ему любое положительное значение меньше `numberOne`
 
 2.3 Создайте свойство `result` и присвойте ему результат деления `numberOne` на `numberTwo`
 
 2.4 Создайте свойство `remainder` и присвойте ему остаток от деления `numberOne` на `numberTwo`
 
 2.5 Выведите на консоль фразу: «При делении <...> на <...> результат равен <...>, остаток равен <...>», подставив вместо (<...>) свои результаты.
 
 2.6 Выведите на консоль еще одну фразу: «Результат деления <...> на <...> равен <...> <...>/<...>». В математике результатом деления 5 на 3 будет натуральная дробь 1 2/3 (здесь мы используем стандартную математическую запись в тексте, а не оператор деления). На консоль необходимо вывести именно такой результат в виде натуральной дроби. Пример: «Результат деления 7 на 3 равен 2 1/3».
 
 */

let numberOne = 15
let numberTwo = 11

let result = numberOne / numberTwo
let remainder = numberOne % numberTwo

print("При делении \(numberOne) на \(numberTwo) результат равен \(result), остаток равен \(remainder)")
print("Результат деления \(numberOne) на \(numberTwo) равен \(result) \(remainder)/\(numberTwo)")

/*:
 ## Задание 3
 3.1 Объявите свойство `dayOfBirth` и присвоейте ему дату вашего рождения
 
 3.2 Объявите свойство `monthOfBirth` и присвоейте ему месяц вашего рождения
 
 3.3 Объявите свойство `yearOfBirth` и присвоейте ему год вашего рождения
 
 3.4 Необходимо рассчитать прожитое время с момента вашего рождения по текущую дату в разных единицах измерения (в годах, в месяцах, в днях и в секундах). За текущее время возьмите сегодняшнюю дату и 0 часов 0 минут. Високосные года учитывать не надо. Пусть среднее количество дней в месяце будет 30, а количество дней в году 360. Создайте все необходимые свойста, которые вам понадобятся для решения данной задачи. Для расчета всех необходимых величин используйте только арифметические операторы. Ни каких функций и условных операторов if-else использовать не нужно.
 
 3.5 Выведите результат вычислений на консоль в виде текста (n years, n months, n days and n seconds have passed since my birth). Пример: если я родился 9 ноября 1980 года, а текущая дата 29.01.20, то результат будет следующим: **39 years, 470 months, 14120 days and 1219968000 seconds have passed since my birth**.
 */

let dayOfBirth = 18
var monthOfBirth = 8
let yearOfBirth = 2020

let currentDay = 19
let currentMonth = 7
let currentYear = 2021

let secondsPerDay = 60 * 60 * 24
let daysPerMonth = 30
let daysPerYear = 360

var daysFromBirth = (currentYear - yearOfBirth) * daysPerYear // Количество дней без учета текущей даты
daysFromBirth += (currentMonth - monthOfBirth) * daysPerMonth // Количество дней с учетом текущего месяца
daysFromBirth += currentDay - dayOfBirth // Количество дней с учетом текущей даты

let secondsFromBirth = secondsPerDay * daysFromBirth
let yearsFromBirth = secondsFromBirth / secondsPerDay / daysPerYear
let monthFromBirth = secondsFromBirth / secondsPerDay / daysPerMonth
daysFromBirth


print("\(yearsFromBirth) years, \(monthFromBirth) months, \(daysFromBirth) days and \(secondsFromBirth) seconds have passed since my birth")

/*:
 *3.6 Выведите на консоль сообщение о том в каком квартале вы родились. Для этого используейте операторы сравнения, что бы сравнить номер месяца вашего рождения с одним из четрырех кварталов. Например если номер месяца больше 0 и меньше или равно 3, то это будет первый квартал. Для получения результата используйте условный оператор if
 */

if monthOfBirth > 0 && monthOfBirth <= 3 {
    print("I was born in the first quarter")
} else if monthOfBirth > 3 && monthOfBirth <= 6 {
    print("I was born in the second quarter")
} else if monthOfBirth > 6 && monthOfBirth <= 9 {
    print("I was born in the third quarter")
} else if monthOfBirth > 9 && monthOfBirth <= 12 {
    print("I was born in the fourth quarter")
} else {
    print("Error")
}

monthOfBirth = 13

if monthOfBirth <= 0 || monthOfBirth > 12 {
    print("error")
} else if monthOfBirth <= 3 {
    print("I was born in the first quarter")
} else if monthOfBirth <= 6 {
    print("I was born in the second quarter")
} else if monthOfBirth <= 9 {
    print("I was born in the third quarter")
} else {
    print("I was born in the fourth quarter")
}

/*:
 ### Задание 4
 Задание на вашу способность гуглить. Необходимо вычислить синус от числа 1 и округлить результат до тысячных. Для получания результата радианы искать не надо. Достаточно найти нужную функцию и она все сделает за вас.
 > Подсказка: в результате должно получиться 0.841
 */

let sinOfOne = sin(1.0)

print("Sinus by one is \(round(sinOfOne * 1000) / 1000)")
print(String(format: "Sinus by one is %.3f", sinOfOne))
