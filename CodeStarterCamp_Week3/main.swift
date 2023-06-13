//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class CoffeeShop {
    var barista: Person
    var profit: Int
    var menuboard: [Coffee : Int] = [:]
    var pickUpTable: [Coffee] = []
    
    init(barista: Person, profit: Int, menuboard: [Coffee : Int], pickUpTable: [Coffee]) {
        self.barista = barista
        self.profit = profit
        self.menuboard = menuboard
        self.pickUpTable = pickUpTable
    }
    
    func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("\(name)이 주문하신 \(coffee.rawValue)나왔습니다. 픽업대에서 가져가세요.")
    }
    
    func totalprofit(coffee: Coffee) {
        profit += coffee.price
        print("총매출액은 \(profit)입니다.")
    }
}


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

var yagombucks: CoffeeShop = CoffeeShop(barista: employee, profit: 0, menuboard: [:], pickUpTable: [])

missKim.order(coffee: .americano, coffeeshop: yagombucks)
yagombucks.make(Coffee.americano, for: "missKim")
yagombucks.totalprofit(coffee: .americano)
