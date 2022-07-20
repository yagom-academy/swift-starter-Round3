//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
class Person {
    var name: String
    var balance: Int
    
    init(name: String, balance: Int) {
        self.name = name
        self.balance = balance
    }
    func order(_ coffee: Coffee, coffeeshop: CoffeeShop) {
        
        guard let price = coffeeshop.coffeeMenu[coffee] else {
            print("메뉴에 해당하는 커피가 없습니다.")
            return
        }
        
        if balance >= price {
            coffeeshop.makeCoffee(_: coffee, from: name)
            balance -= price
            coffeeshop.sales += price
            print("\(name) 남은 금액: \(balance)")
            print("가게 매출액: \(coffeeshop.sales)")
        } else {
            let ininsufficientPrice = price - balance
            print("금액이 \(ininsufficientPrice)원만큼 부족합니다.")
        }
    }
}
class CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    
    var coffeeMenu: Dictionary<Coffee, Int> = [Coffee.americano : 4000, Coffee.latte : 4500, Coffee.macchiato: 5000]
    
    var pickUPTable: [Coffee] = []
    
    func takeOrder(customer: Person, coffee: Coffee ) {
        print("\(customer.name)의 \(coffee)를 주문받았습니다!")
        
    }
    func makeCoffee(_ coffee: Coffee, from name: String) {
        pickUPTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee)이(가) 준비되었습니다. 픽업대에서 가져가주세요")
        
    }
    
    
    
}
enum Coffee {
    case americano, latte, macchiato
    
    var price: Int {
        get {
            switch self {
            case .americano:
                return 4000
            case .latte:
                return 4500
            case .macchiato:
                return 5000
            
            }
        }
    }
}


var missKim: Person = Person(name: "missKim", balance: 10000)
var yagombucks: CoffeeShop = CoffeeShop()
missKim.order(Coffee.americano, coffeeshop: yagombucks)

