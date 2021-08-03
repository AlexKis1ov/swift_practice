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

func calculateValue(operation: CalculationType, values a: Int, _ b: Int) -> Int {
    var result: Int

    switch operation {
    case .addition:
        result = a + b
    case .subtraction:
        result = a - b
    case .multiplication:
        result = a * b
    case .division:
        result = a / b
    }

    print("Результатом \(operation.rawValue) \(a) и \(b) является: \(result)")
    return result
}

//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.

calculateValue(operation: .addition, values: 10, 5)
calculateValue(operation: .subtraction, values: 10, 5)
calculateValue(operation: .multiplication, values: 10, 5)
calculateValue(operation: .division, values: 10, 5)

/*:
 ## Задание 2
 2.1 Создайте перечисление `CurrencyUnit` со следующими кейсами: `rouble`, `dollar`, `euro`.

 Внутри перечисления `CurrencyUnit` создайте еще одно перечисление `DollarCountrys`, в котором содержиться перчень стран-эмитентов (USA, Canada, Australia).

 Рубль и Евро должны иметь ассоциативный параметры следующего типа: `([String], String)`. Массив должен содеражать перечень стран, в которых катируется валюта, а тип стринг - аббривиатуру валюты.

 Доллар должен иметь на один ассоциативный параметр больше, в соответствии с перечислением `DollarCountrys`.
 */

enum CurrencyUnit {
    enum DollarCountries: String {
        case usa = "Доллар США"
        case canada = "Канадский доллар"
        case australia = "Австралийский доллар"
    }

    case rouble(countries: [String], acronym: String)
    case dollar(countries: [String], acronym: String, dollarType: DollarCountries)
    case euro(countries: [String], acronym: String)
}

/*:

 2.2 Создайте экземпляр `dollarCurrency` и присвойете ему значения относящиеся к доллару.
 */

let dollarCurrency: CurrencyUnit = .dollar(
    countries: ["США", "Доминикана", "Куба"],
    acronym: "usd",
    dollarType: .usa
)

/*: 2.3 Создайте функцию, которая должна принимать валюту и выводить на консоль информацию о ней, например: "Доллар США. Катируется в: США, Доминикана, Куба. Краткое наименование: USD. Для рубля и евро нужно будет определить только список стран и аббривиатуру валюты.
 */

func showCurrencyInfo(currency: CurrencyUnit) {
    struct CurrencyInfo {
        var usedCoutries: String = ""
        var acronym: String = ""
        var currencyType: String = ""
    }

    let returnedCurrency: CurrencyInfo

    switch currency {
    case let .rouble(countries, acronym):
        returnedCurrency = CurrencyInfo(
            usedCoutries: countries.joined(separator: ", "),
            acronym: acronym.uppercased(),
            currencyType: "Российский рубль"
        )

    case let .dollar(countries, acronym, dollarType):
        returnedCurrency = CurrencyInfo(
            usedCoutries: countries.joined(separator: ", "),
            acronym: acronym.uppercased(),
            currencyType: dollarType.rawValue
        )

    case let .euro(countries, acronym):
        returnedCurrency = CurrencyInfo(
            usedCoutries: countries.joined(separator: ", "),
            acronym: acronym.uppercased(),
            currencyType: "Евро"
        )
    }

    /*
     Можно было 3 принта в кейсах или 3 перепенные в функции,
     но я решил, что сделать структуру для описания валюты, будет лучше.
     Поправьте, если не прав =)
     */
    print("\(returnedCurrency.currencyType). Катируется в: \(returnedCurrency.usedCoutries). Краткое наименование: \(returnedCurrency.acronym)")
}

showCurrencyInfo(currency: dollarCurrency)

/*:
 ## Задание 3
 3.1 Создайте структуру `ChessPlayer` со следующими свойствами:
 - `name: String`
 - `wins: Int`
 - `description: String`

 Свойство `description` должно возвращать сообщение с именем игрока и количеством его побед.

 Так же необходимо реализовать метод `addWins` который должен увеличивать количество побед на переданное в него значение.
  */

struct ChessPlayer {
    let name: String
    var wins: Int
    var description: String {
        "\(name) - \(wins) wins"
    }

    mutating func addWins(winsCount: Int) {
        wins += winsCount
    }
}

/*:
 3.2 Создайте экзмепляр струкутуры и инициализируйте её свойства. Выведите значение свойства `description` на консоль, а затем вызовите метод `addWins`. Снова выведите значение свойства `description` на консоль.
 */
var chessPlayer = ChessPlayer(name: "Igor", wins: 10)
print(chessPlayer.description)
chessPlayer.addWins(winsCount: 5)
print(chessPlayer.description)
