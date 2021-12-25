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
    var asset: Int
    
    init(name: String, asset: Int) {
        self.name = name
        self.asset = asset
    }
    
    func buy(item: String) {
        print("\(name)이 \(item)을 구매하였습니다")
    }
}

class CoffeeShop {
    enum Coffee {
        case americano
        case latte
        case caramel
    }
    
    var menu: [Coffee: Int] = [Coffee.americano: 4000, Coffee.latte: 4500, Coffee.caramel: 5000]
    var name: String
    var pickUpTable: Int
    var sales: Int
    var baristar: Person?
    
    init(name: String, pickUpTable: Int, sales: Int) {
        self.name = name
        self.pickUpTable = pickUpTable
        self.sales = sales
    }
    
    func getOrder() {
        print("주문을 하시겠습니까?")
    }
    
    func makeCoffee(item: Coffee) {
        switch item {
        case .americano:
            print("아메리카노를 만들고 있습니다.")
        case .latte:
            print("라떼를 만들고 있습니다.")
        case .caramel:
            print("카라멜 마끼아또를 만들고 있습니다.")
        }
    }
}

var misterlee: Person = Person(name: "lee", asset: 5000)
var missKim: Person = Person(name: "kim", asset: 4000)
var yagombucks: CoffeeShop = CoffeeShop(name: "yagombucks", pickUpTable: 5, sales: 100000)
yagombucks.baristar = misterlee

misterlee.buy(item: "latte")
yagombucks.getOrder()
yagombucks.makeCoffee(item: CoffeeShop.Coffee.americano)
