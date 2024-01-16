//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


enum Coffee {
    case americano, latte, coldBrew

    var displayName: String {
        switch self {
        case .americano: return "아메리카노"
        case .latte: return "라떼"
        case .coldBrew: return "콜드브루"
        }
    }
}

class Person {
    var money: Double = 0.0
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        let price = coffeeShop.menu[coffee] ?? 0.0
        if self.money >= price {
            self.money -= price
            coffeeShop.revenue += price
            coffeeShop.makeCoffee(type: coffee, by: name)
        } else {
            print("잔액이 \(price - self.money)원만큼 부족합니다.")
        }
    }
}

class CoffeeShop {
    var revenue: Double = 0.0
    var menu: [Coffee: Double]
    var pickUpTable: [String] = []
    
    init(menu: [Coffee: Double]) {
        self.menu = menu
    }
    
    func makeCoffee(type: Coffee, by name: String) {
        pickUpTable.append("\(name) 님이 주문하신 \(type.displayName)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}


let missKim = Person()
missKim.money = 10.0

let yagombucksMenu: [Coffee: Double] = [.americano: 3.0, .latte: 4.0, .coldBrew: 5.0]
let yagombucks = CoffeeShop(menu: yagombucksMenu)


missKim.order(.coldBrew, of: yagombucks, by: "missKim")
missKim.order(.latte, of: yagombucks, by: "missKim")
missKim.order(.latte, of: yagombucks, by: "missKim")

yagombucks.pickUpTable.forEach { print($0) }
