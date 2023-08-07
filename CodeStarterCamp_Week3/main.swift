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
    var money: Int = 0
    
    mutating func buyCoffee(_ coffee: Coffee, from coffeeShop: inout CoffeeShop) {
        if coffeeShop.validateOrder(coffee, orderedBy: self) {
            coffeeShop.takeOrder(coffee, orderedBy: self)
            guard let unwrapedMenu = coffeeShop.menu[coffee] else {
                return
            }
            money -= unwrapedMenu
        }
    }
}

enum Coffee {
    case americano, latte, cappuccino, espresso
}

struct CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String: [Coffee]] = [:]
        
    func validateOrder(_ coffee: Coffee, orderedBy customer: Person) -> Bool {
        guard let unwrapedMenu = menu[coffee] else {
            print("해당 메뉴는 존재하지 않습니다.")
            return false
        }
        guard customer.money >= unwrapedMenu else {
            print("잔액이 \(unwrapedMenu - customer.money)원만큼 모자랍니다.")
            return false
        }
        return true
    }
    
    mutating func takeOrder(_ coffee: Coffee, orderedBy customer: Person) {
        guard let unwrapedMenu = menu[coffee] else {
            return
        }
        sales += unwrapedMenu
        makeCoffee(coffee, customer: customer.name)
    }
    
    mutating func makeCoffee(_ coffee: Coffee, customer name: String) {
        pickUpTable[name]?.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    init() {
        menu[Coffee.americano] = 4000
        menu[Coffee.cappuccino] = 4500
        menu[Coffee.latte] = 4500
    }
}

var misterLee = Person(name: "misterLee")
var missKim = Person(name: "missKim", money: 3000)

var yagombucks = CoffeeShop()
yagombucks.barista = misterLee

missKim.buyCoffee(.americano, from: &yagombucks)
missKim.money = 5000
missKim.buyCoffee(.americano, from: &yagombucks)
