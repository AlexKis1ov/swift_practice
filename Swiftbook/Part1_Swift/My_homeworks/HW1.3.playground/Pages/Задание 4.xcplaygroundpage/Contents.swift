import Foundation

/*:
 ## Задание 4*
 С помощью блоков `case` определяются возможные значения, которые может принять выражение. Однако Swift позволяет в пределах одного блока case указать не только на значение рассматриваемого параметра, но и на зависимость от какого-либо условия. Данный функционал реализуется с помощью ключевого слова `where` в блоке `case`.

 В этом задании вам необходимо отсортировать конфеты **M&M's** по цвету и по начинке. В первую кучку нужно собрать красные конфеты с шоколадом внутри. Во вторую кучку собирите все желтые конфеты с орехами. А втретью кучку коричневые и зеленые с шоколадом внутри. Нужно реализовать только логику для сортировки конфет. Использовать картежи при этом не нужно.

 */

let candyColor = "red"
let candyFilling = "chocolate"

var firstBunch = 0
var secondBunch = 0
var thirdBunch = 0

switch candyColor {
case "red" where candyFilling == "chocolate":
    firstBunch += 1
case "yellow" where candyFilling == "nuts":
    secondBunch += 1
case "brown" where candyFilling == "chocolate",
     "green" where candyFilling == "chocolate":
    thirdBunch += 1
default:
    print("other candy")
}

print(firstBunch, secondBunch, thirdBunch)

//: [Ранее: Задание 3](@previous)  |  задание 4 из 4  |
