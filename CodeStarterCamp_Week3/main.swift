import Foundation

class Person {
    let name: String
    let age: Int
    let money: Int

    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    func buyCoffee() {
        print("bought Coffee")
    }
}

class CoffeeShop {
    var sales: Int
    let coffeeMenu: Coffee
    let price: Int
    let pickUpTable: Bool
    let barista: Person

    init(sales: Int, coffeeMenu: Coffee, price: Int, pickUpTable: Bool, barista: Person) {
        self.sales = sales
        self.coffeeMenu = coffeeMenu
        self.price = price
        self.pickUpTable = pickUpTable
        self.barista = barista
    }

    func getOrder() {
        print("get Order")
    }

    func makeCoffee() {
        print("making Coffee")
    }
}

enum Coffee: String {
    case americano = "Americano"
    case capouccino = "Cappuccino"
    case latte = "Latte"
}

let misterLee = Person(name: "Lee", age: 26, money: 10000)
let missKim = Person(name: "Kim", age: 31, money: 15000)
