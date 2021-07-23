import Foundation

/*:
 ## Задание 3
 
 Необходимо вычислить **площадь** и **периметр** прямоугольного треугольника.
 
 Катет AC = 8.0
 
 Катет CB = 6.0.
 
 Гипотенузу **AB** вычисляем при помощи функции `sqrt(Double)`, поместив в скобки вместо `Double` сумму квадратов катетов.
 
 > В рассчетах можно спользовать только арифметические операторы. Фукцию `pow` использовать не надо.
 */

let sideAC = 8.0
let sideCB = 6.0

let sideAB = sqrt(sideAC * sideAC + sideCB * sideCB)
let triangleAria = sideAC * sideCB / 2
let trianglePerimeter = sideAC + sideCB + sideAB

//: [Ранее: Задани 2](@previous) | Задание 3 из 3
