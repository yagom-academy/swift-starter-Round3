//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

class Person {
    var money: Double = 15000

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        coffeeShop.make(coffee, from: name, customer: self)
    }
}

class CoffeeShop {
    var revenue: Double = 0.0
    var menu: [(coffeeType: Coffee, price: Double)] = []
    var pickUpTable: [Coffee] = []

    func make(_ coffee: Coffee, from name: String, customer: Person) {
        guard let coffeePrice = menu.first(where: { $0.coffeeType == coffee })?.price else {
            print("해당하는 커피가 메뉴에 없습니다.")
            return
        }

        if customer.money >= coffeePrice {
            customer.money -= coffeePrice
            revenue += coffeePrice
            pickUpTable.append(coffee)
            let moneyShortage = Int(customer.money - coffeePrice)
            print("\(name) 님이 주문하신 \(coffee)이/가 준비되었습니다. 픽업대에서 가져가주세요.")
            print("잔액이 \(moneyShortage)원 부족합니다.")
        } else {
            print("\(name) 님의 돈이 부족합니다. 주문이 취소되었습니다.")
        }
    }
}

enum Coffee {
    case americano
    case latte
    case cappuccino
}

let missKim = Person()
let yagombucks = CoffeeShop()
yagombucks.menu = [(coffeeType: .americano, price: 3000), (coffeeType: .latte, price: 4000), (coffeeType: .cappuccino, price: 4500)]
missKim.order(.cappuccino, of: yagombucks, by: "missKim")
