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

    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee...) {
        var menu = [String]()
        
        for i in coffee {
            menu.append(i.rawValue)
        }
        print("\(name): \(menu)주세요.")
    }
}

struct CoffeeShop {
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
    
    mutating func make(_ coffee: Coffee) {
        if let price = menu[coffee] {
            print("\(name): \(coffee.rawValue)를 주문하셨습니다. 가격은 \(price)원 입니다.")
            salesAmount += price
            pickUpTable.append(coffee)
            print("\(name): 주문하신 \(pickUpTable) 나왔습니다.")
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


