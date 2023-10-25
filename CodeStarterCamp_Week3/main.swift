//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


struct Person {
    var money: Int
    init(money: Int) {
        self.money = money
    }
    func buyCoffee(order: [String]) {
        print("\(order)을(를) 구매합니다.")
    }
}

struct CoffeeShop {
    var salesVolume: Int = 0
    let menu: [String: Int] = ["아메리카노": 2500, "카페라떼": 4000]
    var pickupTable: [String] = []
    var barista: Person?
    
    mutating func receivedOrder(order: String) {
        print("\(order) 메뉴의 주문이 들어왔습니다.")
    }
    mutating func makeCoffee(order: String) {
        pickupTable = [order]
        print("\(order) 메뉴의 제작이 완료되었습니다.")
    }
    
}

enum Coffee {
    case 아메리카노(price: Int, type: String)
    case 카페라떼(price: Int, type: String)
    case 돌체라떼(price: Int, type: String)
    case 아포가토(price: Int)
    }


var misterLee: Person = Person(money: 10000)
var missKim: Person = Person(money: 50000)

var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee


