//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    init (name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func buyItem(someItem: String) {
        print("\(someItem)을(를) 구입하셨습니다.")
    }
}

struct CoffeeShop {
    var barista: Person?
    var salesRevenue: Int = 0
    var menuBoard: [CoffeeType: Int] = [:]
    var pickUpTable: CoffeeType?
    
    mutating func orderCoffee(coffee: CoffeeType) {
        if menuBoard.keys.contains(coffee) {
            print("\(coffee)을(를) 주문하셨습니다.\(coffee)을(를) 만듭니다.")
            makeCoffee(coffee: coffee)
        } else {
            print("\(coffee)은(는) 판매하지 않습니다.")
        }
    }
        
    mutating func makeCoffee(coffee: CoffeeType) {
        pickUpTable = coffee
        print("주문하신 \(coffee)이(가) 준비됐습니다.")
    }
}

enum CoffeeType {
    case americano, cafeLatte, espresso, cappuccino, cafeMocha
}

let misterLee = Person(name: "misterLee", money: 100_000)
let missKim = Person(name: "missKim", money: 200_000)
var yagombucks = CoffeeShop(menuBoard: [.americano : 4000,
                                        .cafeLatte : 4200,
                                        .espresso : 3000,
                                        .cappuccino : 4300,
                                        .cafeMocha : 4500])
yagombucks.barista = misterLee
yagombucks.orderCoffee(coffee: .americano)



