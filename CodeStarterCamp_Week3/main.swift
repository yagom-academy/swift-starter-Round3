//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case latte
    case cappuccino
}

class Person {
    var name: String
    var money: Double

    init(name: String, money: Double) {
        self.name = name
        self.money = money
    }

    func order(_ coffee: Coffee, from coffeeShop: CoffeeShop) {
        coffeeShop.makeCoffee(type: coffee, from: self.name)
    }
}

class CoffeeShop {
    var sales: Double
    var menu: [Coffee: Double]
    var pickUpTable: [Coffee]
    var barista: Person

    init(sales: Double, menu: [Coffee: Double], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = []
        self.barista = barista
    }

    func takeOrder(from customer: Person, coffeeType: Coffee) {
        if let price = menu[coffeeType], customer.money >= price {
            customer.money -= price
            sales += price
            makeCoffee(type: coffeeType, from: customer.name)
        } else {
            if let price = menu[coffeeType] {
                let difference = price - customer.money
                print("잔액이 \(difference)원만큼 부족합니다.")
            } else {
                print("해당하는 커피가 메뉴에 없습니다.")
            }
        }
    }

    internal func makeCoffee(type: Coffee, from name: String) {
        pickUpTable.append(type)
        print("\(name) 님이 주문하신 \(coffeeName(type))\(coffeePostfix(type)) 준비되었습니다. 픽업대에서 가져가주세요.")
    }

    private func coffeeName(_ coffee: Coffee) -> String {
        switch coffee {
        case .americano: return "아메리카노"
        case .latte: return "라떼"
        case .cappuccino: return "카푸치노"
        }
    }

    private func coffeePostfix(_ coffee: Coffee) -> String {
        return (coffee == .americano) ? "이" : "가"
    }
}

let missKim = Person(name: "missKim", money: 15.0)

let yagombucksMenu: [Coffee: Double] = [.americano: 3.0, .latte: 4.0, .cappuccino: 4.5]
let yagombucks = CoffeeShop(sales: 0.0, menu: yagombucksMenu, barista: missKim)

missKim.order(.cappuccino, from: yagombucks)


