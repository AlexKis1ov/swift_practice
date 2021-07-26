//: [Previous](@previous)

import Foundation

//: ### Вариативные параметры

func arithmeticMean(_ numbers: Double...) -> Double {
    var total = 0.0
    
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

arithmeticMean(1, 3.14, -13, 0.0, 45)

//: [Next](@next)
