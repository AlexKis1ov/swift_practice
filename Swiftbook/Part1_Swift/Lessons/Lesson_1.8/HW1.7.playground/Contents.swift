import UIKit

//: # Home Work 7

/*:
 ## Задание 1
 1.1 Создайте перечисление `CalculationType`, содержащее четыре математических действия — *сложение*, *вычитание*, *умножение* и *деление*.
 */

enum CalculationType: String {
    case addition = "сложения"
    case subtraction = "вычитания"
    case multiplication = "умножения"
    case division = "деления"
}

//: 1.2 Напишите функцию возвращающую `Int` и принимающую в качестве параметров три значения: число один, число два и тип математической операции. Внутри функции, в зависимости от значения параметра `CalculationType` выполните соответствующую математическую операцию с константами и верните результат. Реализуйте функцию таким образом, что бы при каждом её вызове на консоль выводилось сообщение следующего содержания: «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>».

func getResult(_ calculationType: CalculationType, betweenNumber firstNumber: Int, andNumber secondNumber: Int) -> Int? {
    
    var result = firstNumber
    
    switch calculationType {
    case .addition: result += secondNumber
    case .subtraction: result -= secondNumber
    case .multiplication: result *= secondNumber
    case .division:
        secondNumber != 0
            ? result /= secondNumber
            : print("На ноль делить нельзя")
        return nil
    }
    
    print("Результат \(calculationType.rawValue) \(firstNumber) и \(secondNumber) равен \(result)")
    
    return result
}

//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.

getResult(.addition, betweenNumber: 10, andNumber: 5)
getResult(.subtraction, betweenNumber: 10, andNumber: 5)
getResult(.division, betweenNumber: 10, andNumber: 5)
getResult(.multiplication, betweenNumber: 10, andNumber: 5)

/*:
 ## Задание 2
 2.1 Создайте перечисление `CurrencyUnit` со следующими кейсами: `rouble`, `dollar`, `euro`.
 
 Внутри перечисления `CurrencyUnit` создайте еще одно перечисление `DollarCountrys`, в котором содержиться перчень стран-эмитентов (USA, Canada, Australia).
 
 Рубль и Евро должны иметь ассоциативный параметры следующего типа: `([String], String)`. Массив должен содеражать перечень стран, в которых катируется валюта, а тип стринг - аббривиатуру валюты.
 
 Доллар должен иметь на один ассоциативный параметр больше, в соответствии с перечислением `DollarCountrys`.
 */

enum CurrencyUnit {
    
    enum DollarCountries: String {
        case usa = "США"
        case canada = "Канада"
        case australia = "Австралия"
    }
    
    enum ShortName: String {
        case usd = "USD"
        case rub = "RUB"
        case eur = "EUR"
    }
    
    case rouble(сountries: [String], shortName: ShortName)
    case dollar(сountries: [String], shortName: ShortName, national: DollarCountries)
    case euro(сountries: [String], shortName: ShortName)
}

/*:

 2.2 Создайте экземпляр `dollarCurrency` и присвойете ему значения относящиеся к доллару.
 */

let dollar = CurrencyUnit.dollar(сountries: ["США", "Доминикана", "Куба"], shortName: .usd, national: .usa)

/*: 2.3 Создайте функцию, которая должна принимать валюту и выводить на консоль информацию о ней, например: "Доллар США. Катируется в: США, Доминикана, Куба. Краткое наименование: USD. Для рубля и евро нужно будет определить только список стран и аббривиатуру валюты.
*/

func getInfoAbout(_ currency: CurrencyUnit) {
    switch currency {
      
    case let .rouble(сountries, shortname), let .euro(сountries, shortname):
        print("""
          Рубль. Катируется в: \(сountries.joined(separator: ", ")).
          Краткое наименование: \(shortname.rawValue)
          """)
      
    case let .dollar(сountries, shortname, national):
        print("""
          Доллар \(national.rawValue).
          Катируется в: \(сountries.joined(separator: ", ")).
          Краткое наименование: \(shortname.rawValue)
          """)
    }
}

getInfoAbout(dollar)
 
/*:
 ## Задание 3
 3.1 Создайте структуру `ChessPlayer` со следующими свойствами:
 - `name: String`
 - `wins: Int`
 - `description: String`
 
 Свойство `description` должно возвращать сообщение с именем игрока и количеством его побед.
 
 Так же необходимо реализовать метод `addWins` который должен увеличивать количество побед на переданное в него значение.
  */

struct PlayerInChess {
    let name: String
    var wins: Int
    var description: String {
        "Игрок \(name), имеет \(wins) побед"
    }
    
    mutating func addWins(countOfWins: Int) {
        wins += countOfWins
    }
}

var playerInChess = PlayerInChess(name: "Tim Cook", wins: 6)
print(playerInChess.description)
playerInChess.addWins(countOfWins: 3)
print(playerInChess.description)

/*:
 3.2 Создайте экзмепляр струкутуры и инициализируйте её свойства. Выведите значение свойства `description` на консоль, а затем вызовите метод `addWins`. Снова выведите значение свойства `description` на консоль.
*/


