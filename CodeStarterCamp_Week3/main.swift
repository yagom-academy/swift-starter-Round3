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
    func buyCoffee(order: [Coffee]) {
        print("\(order)을(를) 구매합니다.")
    }
}

struct CoffeeShop {
    var salesVolume: Int = 0
    let menu: [Coffee: Int] = [Coffee.아메리카노: 2500, Coffee.카페라떼: 4000]
    var pickupTable: [String] = []
    var barista: Person?
    
    mutating func receiveOrder(order: String) {
        print("\(order) 메뉴의 주문이 들어왔습니다.")
    }
    mutating func makeCoffee(order: String) {
        pickupTable = [order]
        print("\(order) 메뉴의 제작이 완료되었습니다.")
    }
    
}

enum Coffee {
    case 아메리카노
    case 카페라떼
    case 돌체라떼
    case 아포가토
    }


var misterLee: Person = Person(money: 10000)
var missKim: Person = Person(money: 50000)

var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee


