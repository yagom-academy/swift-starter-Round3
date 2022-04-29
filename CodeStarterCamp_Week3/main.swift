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
    let coffeeOptions: String
    let price: Int
    let pickUpTable: Bool

    init(sales: Int, coffeeOptions: String, price: Int, pickUpTable: Bool) {
        self.sales = sales
        self.coffeeOptions = coffeeOptions
        self.price = price
        self.pickUpTable = pickUpTable
    }

    func getOrder() {
        print("get Order")
    }

    func makeCoffee() {
        print("making Coffee")
    }
}
