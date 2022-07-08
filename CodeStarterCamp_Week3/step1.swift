//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by junho lee on 2022/07/07.
//

import Foundation

class Person {
    var name: String
    var cashInWallet: Int
    
    init(name: String, cashInWallet: Int) {
        self.name = name
        self.cashInWallet = cashInWallet
    }
    
    func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(coffeeShop.name)에서 \(coffee.rawValue)을 주문합니다.")
        coffeeShop.takeCoffeeOrder(orderCustomer: self, coffee: coffee)
    }
}

class CoffeeShop {
    var name: String
    var sales: Int = 0
    var menuBoard: Dictionary<Coffee, Int> = [.americano: 2500,
                                              .caffeLatte: 3000,
                                              .cappuccino: 3500,
                                              .macchiato: 4000]
    var pickUpTable: Array<Coffee> = []
    var barista: Person?
    
    init(name: String) {
        self.name = name
    }
    
    func takeCoffeeOrder(orderCustomer: Person, coffee: Coffee) {
        print("\(orderCustomer.name) 고객님에게 \(coffee.rawValue)를 주문 받았습니다.")
        placeCoffeOnPickupTable(makeCoffee(coffee))
    }
    
    func makeCoffee(_ coffee: Coffee) -> Coffee {
        print("\(coffee.rawValue)를 만들었습니다.")
        return coffee
    }
    
    func placeCoffeOnPickupTable(_ coffee: Coffee) {
        print("\(coffee.rawValue)가 픽업 테이블로 나왔습니다.")
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case caffeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case macchiato = "마키아또"
}
