import Foundation

enum Coffee {
    case espresso, latte, macchiato, cappuccino
}

class Person {
    var name: String
    var age: Int
    var money: Int
    var bag: [Any]
    
    func order(_ coffee: Coffee, coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if money >= coffeePrice {
                coffeeShop.make(coffee, from: self.name)
                money -= coffeePrice
                bag.append(coffee)
            } else {
                print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
            }
        } else {
            print("메뉴판에 없는 메뉴입니다.")
        }
    }
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
        bag = [Any]()
    }
}

class CoffeeShop {
    var barista: Person
    var sales: Int
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: [Coffee]

    func printInfo() {
        print("===== print coffeeShop info =====")
        print(" 바리스타: \(self.barista) \n 매출액: \(self.sales)\n pickUpTable: \(pickUpTable)")
        print("=================================")
    }
    func addPickUpTable(_ coffee: Coffee, from name: String) {
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        pickUpTable.append(coffee)
    }
    func make(_ coffee: Coffee, from name: String) {
        if let coffeePrice = menu[coffee] {
            addPickUpTable(coffee, from: name)
            sales += coffeePrice
        } else {
            print("메뉴판에 없는 메뉴입니다.")
        }
    }
    
    func setMenu() {
        self.menu[Coffee.espresso] = 4000
        self.menu[Coffee.cappuccino] = 4500
        self.menu[Coffee.latte] = 5000
    }

    init(barista: Person, sales: Int) {
        self.sales = sales
        self.barista = barista
        menu = [Coffee: Int]()
        self.pickUpTable = [Coffee]()
        self.setMenu()
    }
}

var misterLee = Person(name: "misterLee", age: 30, money: 10000)
var missKim = Person(name: "missKim", age: 32, money: 10000)
var yagombucks = CoffeeShop(barista: misterLee, sales: 0)

yagombucks.printInfo()
missKim.order(Coffee.espresso, coffeeShop: yagombucks)
missKim.order(Coffee.macchiato, coffeeShop: yagombucks)
missKim.order(Coffee.cappuccino, coffeeShop: yagombucks)
missKim.order(Coffee.latte, coffeeShop: yagombucks)
yagombucks.printInfo()
