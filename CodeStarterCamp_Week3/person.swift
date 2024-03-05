//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지은 on 2/24/24.
//

struct Person{
    let name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, at coffeeShop: CoffeeShop, by name: String) {
        guard let priceOfCoffee = coffeeShop.menu[coffee] else {
            print("잘못된 주문입니다.")
            return
        }
        if money < priceOfCoffee {
            print("\(name)님, 잔액이 \(priceOfCoffee - money)만큼 부족합니다. (현재 잔액: \(money))\n")
            return
        }
        money -= priceOfCoffee
        coffeeShop.takeOrder(coffee, from: name)
    }
}
