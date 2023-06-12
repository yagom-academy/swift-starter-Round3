//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct CoffeeShop {
    var barista: Person
    var profit: Int
    var menuboard: [Coffee : Int] = [:]
    var pickUpTable: [(Coffee,Person)] = []
    
    mutating  func orderCoffee(coffee: Coffee) {
        print("주문한 \(coffee.rawValue)가 나왔습니다.")
    }
    
    mutating func addPickUpTable(coffee: Coffee, person: Person) {
        pickUpTable.append((coffee, person))
        print("주문하신 메뉴 가져가세요.")
    }
    
    mutating func totalprofit(coffee: Coffee) {
        profit += coffee.price
        print("총매출액은 \(profit)입니다.")
    }
}

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, profit: 0)

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .latte:
            return 6000
        }
    }
}

missKim.buyCoffee(coffee: .americano)
missKim.orderMoney(coffee: .americano, coffeeshop: yagombucks)
print(missKim.money)
yagombucks.orderCoffee(coffee: .americano)
yagombucks.addPickUpTable(coffee: .americano, person: missKim)
yagombucks.totalprofit(coffee: .americano)
