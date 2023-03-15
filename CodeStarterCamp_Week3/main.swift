//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var money: Int

    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        
        if let price = coffeeShop.menu[coffee] {
            if money < price {
                print("\(name)은 잔액이 \((money - price) * -1)원만큼 부족합니다.")
            } else {
                money -= price
                coffeeShop.make(coffee, for: name)
            }
        }
    }
}

class CoffeeShop {
    var name: String
    var owner: String
    var barista: Person
    var salesAmount: Int
    var menu: [Coffee: Int]
    var pickUpTable = [Coffee]()
    
    init(name: String, owner: String, barista: Person, salesAmount: Int, menu: [Coffee : Int], pickUpTable: [Coffee] = [Coffee]()) {
        self.name = name
        self.owner = owner
        self.barista = barista
        self.salesAmount = salesAmount
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func make(_ coffee: Coffee, for name: String) {
        if let price = menu[coffee] {
            salesAmount += price
            pickUpTable.append(coffee)
            print("\(self.name): \(name)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가 주세요.")
        } else {
            print("\(name): 저희 매장에서 그런 커피는 취급하지 않습니다.")
        }
        
    }
}

enum Coffee: String {
    case americano = "아메리카노", cafeMocha = "카페모카"
}

var misterLee: Person = Person(name: "Lee", money: 10000)
var missKim: Person = Person(name: "Kim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(name: "야곰벅스",
                                        owner: "redmango",
                                        barista: misterLee,
                                        salesAmount: 0,
                                        menu: [.cafeMocha: 4000])

missKim.order(.cafeMocha, of: yagombucks, by: missKim.name)
