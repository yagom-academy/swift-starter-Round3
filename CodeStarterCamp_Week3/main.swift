//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String?
    var gender: String?
    var money: Int = 0
    
    func buySomething(thingsToBuy: String, price: Int) {
        if money >= price {
            print("\(thingsToBuy)을(를) 샀다.")
        } else {
            print("\(thingsToBuy)을(를) 돈이 없어서 못샀다.")
        }
    }
}

struct CoffeeShop {
    var sales: Int = 0
    
    enum CoffeMenu {
        case espresso, americano, cafelatte, capuccino
        
        var coffePrice: Int {
            switch self {
            case .espresso:
                return 3600
            case .americano:
                return 4100
            case .cafelatte:
                return 4600
            case .capuccino:
                return 4600
            }
        }
    }
    
    var pickUpTable: String?
    
    func takeCoffeeOrder(person: String, coffee: String, coffeePrice: Int) {
        print("커피 주문 : \(person) 님이 [\(coffee), \(coffeePrice)원] 을 주문하였습니다.")
    }
    
    func makeCoffee(coffee: String) {
        print("커피를 만듭니다.")
    }
}

