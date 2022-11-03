import Foundation

enum Coffee {
    case espresso, latte, macchiato, cappuccino
}

class Person {
    var name: String
    var age: Int
    var money: Int
    var bag: [Any]?
    
    func buyCoffee(coffee: Coffee, coffeePrice: Int) {
        if money > coffeePrice {
            print("커피를 구매하였습니다.")
            money -= coffeePrice
            bag?.append(coffee)
        }
    }
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
}

class CoffeeShop {
    var barista: Person?
    var sales: Int
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: [Coffee]? = nil

    func makeCoffee(coffee: Coffee) {
        print("\(coffee)를 만들었습니다.")
        pickUpTable?.append(coffee)
    }
    func takeOrder(coffee: Coffee) {
        if let coffeePrice = menu[coffee] {
            makeCoffee(coffee: coffee)
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
    
    convenience init(barista: Person, sales: Int) {
        self.init(sales: sales)
        self.barista = barista
    }
    init(sales: Int) {
        self.sales = sales
        menu = [Coffee: Int]()
        self.setMenu()
    }
}

var misterLee: Person = Person(name: "misterLee", age: 30, money: 10000)
var missKim: Person = Person(name: "missKim", age: 32, money: 8000)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, sales: 5000000)
