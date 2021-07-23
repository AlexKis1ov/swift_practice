import Foundation

/*:
 ## Задание 3

 Необходимо вычислить **площадь** и **периметр** прямоугольного треугольника.

 Катет AC = 8.0

 Катет CB = 6.0.

 Гипотенузу **AB** вычисляем при помощи функции `sqrt(Double)`, поместив в скобки вместо `Double` сумму квадратов катетов.

 > В рассчетах можно спользовать только арифметические операторы. Фукцию `pow` использовать не надо.
 */

let legAC = 8.0
let legCB = 6.0
let hypotenuse = sqrt(legAC * legAC + legCB * legCB)

let perimeter = legAC + legCB + hypotenuse
let square = legAC * legCB / 2

//: [Ранее: Задани 2](@previous) | Задание 3 из 3
