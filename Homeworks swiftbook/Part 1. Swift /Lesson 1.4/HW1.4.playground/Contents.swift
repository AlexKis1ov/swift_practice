import UIKit

//: # Home Work 4

/*:
 ## Задание 1
 Пользователь открывает вклад (deposit) в банке на 5 лет (period) на сумму 500 тыс. рублей. Процентная ставка годовых (rate) составляет 11%. Необходимо просчитать сумму дохода (profit) по окончании срока действия вклада и вывести результат на консоль в таком виде: "Сумма вклада через <... > лет увеличится на <...> и составит <...> рублей".  Для решения данной задачи используйет цикл for-in.
 
 > Cумма вклада увеличивается с каждым годом и процент нужно считать уже от увелеченной суммы.
  */

var deposit = 500000.0
let rate = 11.0
let period = 5

let startDeposit = deposit

for _ in 1...period {
	deposit *= (rate / 100.0 + 1.0)
}

let profit = deposit - startDeposit

print("Сумма вклада через \(period) лет увеличится на \(round(profit * 100) / 100) и составит \(round(deposit * 100) / 100) рублей")

/*:
 ## Задание 2
 2.1 Создайте целочисленный массив данных с любым набором чисел.
*/

let numbersOfInt = [1, 2, 3, 4, 5, 6, 7, 8, 9]

//: 2.2 Выведите на консоль все четные числа из массива

for number in numbersOfInt {
	if number % 2 == 0 {
		print(number)
	}
}

/*: 2.3* В циклах для перехода к следующей итерации без выполнения последующего кода можно использовать опретор `Continue`. В этом случае весь последующий код игорируется.
 
 Используя оператор `Continue` выведите на консоль все нечетные числа из массива. Для этого нужно выполнить проверку на четность числа, и если оно оказалось четным перейти к следующей итерации.
*/

for number in numbersOfInt {
	if number % 2 == 0 {
		continue
	}
	print(number)
}

/*: ## Задание 3
Создайте цикл с интервалом от 1 до 10 в котором случайным образом вычисляеться число в пределах от 1 до 10. Если выпадет число 5, выведите на коносль сообщение с номером итерации и остановите цикл. Пример сообщения: "Что бы выпало число 5 понадобилось <...> итераций".

Для остановки цикла используйте оператор breack. Данный оператор предназначен для досрочного завершения работы цикла. При этом весь последующий код в теле цикла игнорируется.
 
 Для определения случайного числа используйте функцию random: `Int.random(1...10)`
*/

for iterator in 1...10 {
	if Int.random(in: 1...10) == 5 {
		print("Что бы выпало число 5 понадобилось \(iterator) итераций")
		break
	}
}

/*:
 ## Задание 4
  На 10 метровый столб лезет черепашка. За день она забирается на два метра, за ночь съезжает на один. Определите при помощи цикла, через сколько дней она заберетсья на столб. Подумайте над тем, какой цикл использовать в этой ситуации.
 */

var daysCounter = 0
var turtlePosition = 0
var isDay = true

while turtlePosition < 10 {
	if isDay {
		daysCounter += 1
		turtlePosition += 2
		isDay = false
	} else {
		turtlePosition -= 1
		isDay = true
	}
}

print("\(daysCounter) days")
