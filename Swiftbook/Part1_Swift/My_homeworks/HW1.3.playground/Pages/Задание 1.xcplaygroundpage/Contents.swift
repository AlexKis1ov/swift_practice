import UIKit

//: # Home work 3

/*:
 ## Задание 1
 Представьте, что вы владелец розничного магазина и вам необходимо установить стоимость товара в зависимости от его количества. До 9 единиц товара вкючительно цена составляет 1000 рублей за штуку. От 10 до 19 единиц товара включительно - 800 руб. шт. И 600 рублей за товар от 20 единиц и выше. Создайте условие при котором цене будет присвоино соответсвующее значение, используя конструкцию `if-else`. Подсчитайте общую сумму и выведите результат на консоль.
 */

let count = 10
var price = 0
var totalSum = 0

if count >= 20 {
    price = 600
} else if count >= 10 {
    price = 800
} else if count > 0, count <= 9 {
    price = 1000
} else {
    print("wrong count")
    price = 0
}

totalSum = price * count

print("Quantity of goods sold - \(count)\nPrice - \(totalSum)")

//: |  задание 1 из 4  |  [Далее: Задание 2](@next)
