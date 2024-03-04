//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지은 on 2/24/24.
//

class Person{
    var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    func order(_ coffee: Coffee, at coffeeShop: CoffeeShop, by name: String) {
        guard let priceOfCoffee = coffeeShop.menu[coffee] else {
            print("잘못된 주문입니다.")
            return
        }
        if money < priceOfCoffee {
            print("\(name)님, 잔액이 \(priceOfCoffee - money)만큼 부족합니다. (현재 잔액: \(money))\n")
            return
        }
        money -= priceOfCoffee
        coffeeShop.take(order: coffee, from: name)
    }
}
