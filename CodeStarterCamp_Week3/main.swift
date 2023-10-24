//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


struct Person {
    var money: Int = 10000
    
    func buyCoffee(order: String) {
        print("\(order)을(를) 구매합니다.")
    }
}

struct CoffeeShop {
    var salesVolume: Int = 100000
    let menu: [String: Int] = ["아메리카노": 2500, "카페라떼": 4000]
    var pickupTable: [String] = []
    
    mutating func receivedOrder(order: String) {
        print("\(order) 메뉴의 주문이 들어왔습니다.")
    }
    mutating func makeCoffee(order: String) {
        pickupTable = [order]
        print("\(order) 메뉴의 제작이 완료되었습니다.")
    }
    
}

struct Coffee {
    enum coffeeType {
        case 아메리카노, 카페라떼, 돌체라떼, 아포가토
    }
}
