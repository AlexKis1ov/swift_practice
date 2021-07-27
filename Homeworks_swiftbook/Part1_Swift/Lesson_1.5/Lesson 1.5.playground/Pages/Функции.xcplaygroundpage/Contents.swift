
import Foundation
//: # Lesson 5

//: ## Функции

/*:
 
    func nameOfFunction() {
        some code
    }
 
 */


/*
func addingTwoNumbers() {
    let a = 3
    let b = 2
    let c = a + b
    
    print(c)
}

let result = addingTwoNumbers
addingTwoNumbers()
result()
*/


//: ### Функции с возвращаемыми значениями

/*:
    func nameOfFunction() -> Data Type {
        some code
        return some value
    }
 
 */

func addingTwoNumbers() -> Int {
    let a = 3
    let b = 2
    
    return a + b
}

var result = addingTwoNumbers()

//: ### Функции с параметрами

/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */

// Функция с параметрами без аргументов
func addingTwoNumbers(a: Int, b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(a: 3, b: 7)


// Функция с параметрами и аргументами
func addingTwoNumbers(number a: Int, andNumber b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(number: 5, andNumber: 3)

func addingTwoNumbers(_ a: Int, _ b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(3, 5)

func addingTwoNumbers(_ a: Int, and b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(4, and: 7)

//: [Next](@next)
