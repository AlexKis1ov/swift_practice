import UIKit

//: # Home Work 5
/*:
 ## Задание 1
 Создайте словарь, который содержит результаты игр спортивной команды. Ключом словаря должно быть название команды соперника, а в качестве значения должен быть массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр. Выглядить это должно примерно следующим образом:

 - Игра с Салават Юлаев - 3:6

 - Игра с Салават Юлаев - 5:5

 - Игра с Салават Юлаев - N/A

 - Игра с Авангард - 2:1

 - Игра с АкБарс - 3:3

 - Игра с АкБарс - 1:2
 */

let games = [
    "Салават Юлаев": ["3:6", "5:5", ""],
    "Авангард": ["2:1"],
    "АкБарс": ["3:3", "1:2"]
]

for (enemyTeam, gamesWithEnemyTeam) in games {
    for currentGame in gamesWithEnemyTeam {
        if currentGame.isEmpty {
            print("• Игра с \(enemyTeam) - N/A")
            continue
        }
        print("• Игра с \(enemyTeam) - \(currentGame)")
    }
}

/*:
 ## Задание 2
 Создайте функцию, которая считает общую сумму денег, хранящихся в кошельке. Вызовите функцию и передайте в неё кошелек с деньгами. В кошельке могут храниться купюры различного достоинства от 50 до 5000 рублей.
 */

let wallet = [
    50: 0,
    100: 10,
    500: 3,
    1000: 0,
    2000: 2,
    5000: 10
]

func calculateSum(inWallet wallet: [Int: Int]) -> Int {
    var allSum = 0
    for (nominalValue, quantity) in wallet {
        allSum += nominalValue * quantity
    }
    return allSum
}

print("\nFinal sum: \(calculateSum(inWallet: wallet))\n")

/*:
 ## Задание 3
 3.1 Создайте функцию, которая определяет является ли число четным. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`.
 */

func determineParityOfNumber(_ number: Int) -> Bool {
    number % 2 == 0
}

/*:
 3.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение.
 */

func divideOnThreeWithoutRemainder(_ number: Int) -> Bool {
    number % 3 == 0
}

/*:
 3.3 Создайте функцию, которая возвращает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен задаваться при вызове функции при помощи параметров. Вы должны самостоятельно реализовать логику создания массива. Если хотите усложить задание, то можете возвращать несортированный массив чисел в заданном интервале. Главное, что бы числа были уникальными и не повторялись. При этом количество элементов массива должно соответсвовать количеству элементов заданного интервала.
 */

func giveArrayOfFange(firstElement first: Int, lastElement last: Int) -> [Int] {
    var returnedArray: [Int] = []
    for number in first ... last {
        returnedArray.append(number)
    }
    return returnedArray
}

/*:
 3.4 Создайте массив чисел от *1* до *100*, используя для этого вышесозданную функцию
  */

let rangeArray = giveArrayOfFange(firstElement: 1, lastElement: 100)

/*:
 3.5 Создайте функцию для фильтрации переданного в неё массива и отфильтруйте при помощи неё массив из задания **3.4**. Функция должна возвращать новый массив без четных чисел или без чисел, кратных трем. Для определения фильтруемых значений используейте ранее созданные функции из заданий **3.1** и **3.2**.
 */

func filterCollection(array: [Int], closure: (Int) -> Bool) -> [Int] {
    var retunedArray: [Int] = []
    for element in array {
        if !closure(element) {
            retunedArray.append(element)
        }
    }
    return retunedArray
}

print(filterCollection(array: rangeArray, closure: determineParityOfNumber))
print(filterCollection(array: rangeArray, closure: divideOnThreeWithoutRemainder))
