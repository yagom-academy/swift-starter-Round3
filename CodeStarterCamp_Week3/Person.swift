import Foundation

class Person {
    let name: String
    let age: Int
    var money: Int

    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    func buyCoffee(menu: CoffeeMenu, size: Size, iceOrHot: IceOrHot, quantity: Int, at coffeeShop: CoffeeShop) {
        coffeeShop.order(menu: menu, size: size, iceOrHot: iceOrHot, quantity: quantity, customer: self)
    }
}
