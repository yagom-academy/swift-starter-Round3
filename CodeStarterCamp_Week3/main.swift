//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case 아메리카노 = "아메리카노"
    case 카푸치노 = "카푸치노"
    case 카페라떼 = "카페라떼"
    case 아포카토 = "아포카토"
}

struct Person {
    var name: String
    var money: Int
    var coffeeShop: CoffeeShop?
    
    mutating func order(_ coffee: Coffee) {
        guard let coffeePrice = coffeeShop?.menus[coffee] else {
            print("주문이 불가능합니다.")
            return
        }
        
        if self.money >= coffeePrice {
            self.money -= coffeePrice
            coffeeShop?.make(coffee, from: self.name)
            return
        }
        print("잔액이 \(coffeePrice - self.money)원만큼 부족합니다.")
    }
}

struct CoffeeShop {
    var totalSales: Int
    var menus: [Coffee:Int]
    var pickUpTable = [Coffee]()
    
    mutating func make(_ coffee: Coffee, from name: String) {
        guard let coffeePrice = self.menus[coffee] else { return }
        
        self.totalSales += coffeePrice
        self.pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

var yagombucks = CoffeeShop(totalSales: 10000,
                            menus: [Coffee.아메리카노:4500, Coffee.카푸치노:5500,
                                    Coffee.카페라떼:5000, Coffee.아포카토:6000])
var missKim = Person(name: "missKim", money: 6800)
var coda = Person(name: "Coda", money: 10000)

missKim.coffeeShop = yagombucks
coda.coffeeShop = yagombucks

missKim.order(Coffee.카푸치노)
coda.order(Coffee.아메리카노)

missKim.order(Coffee.아포카토)
