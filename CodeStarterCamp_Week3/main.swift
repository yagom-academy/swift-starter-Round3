import Foundation

class Person {
    var money: Int

    init(money: Int) {
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
