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
    
    mutating func buyCoffee(order: [Coffee], of coffeeShop: CoffeeShop, by name: Person) {
        var totalPrice = 0
        for coffee in order {
            totalPrice += coffee.price
        }

        if money >= totalPrice
            {
            print("\(order)을(를) 구매합니다. 주머니에 있는 \(money)에서 \(totalPrice)를 지불합니다.")
            self.money -= totalPrice
            print("현재 제 주머니에는 \(money)원이 남아있네요.")
            coffeeShop.receiveOrder(order: order)
            }
        else
            {
            var neededMoney = totalPrice - money
            print("잔액이 \(neededMoney)만큼 부족합니다.")
            }
        }
}

struct CoffeeShop {
    var salesVolume: Int = 0
    let menu: [Coffee] = [.iceAmericano, .hotAmericano, .cafeLatte, .coldBrew]
    var pickupTable: [String] = []
    var barista: Person?
    
    mutating func receiveOrder(order: [Coffee]) {
        print("\(order) 메뉴의 주문이 들어왔습니다.")
        //salesVolume에 totalPrice를 더한다.
        //makeCoffee를 시작한다.
    }
    mutating func makeCoffee(order: String) {
        pickupTable = [order]
        print("\(order) 메뉴의 제작이 완료되었습니다.")
    }
    
}

enum Coffee {
    case iceAmericano
    case hotAmericano
    case cafeLatte
    case coldBrew

    var name: String {
        switch self {
        case .iceAmericano: return "아이스 아메리카노"
        case .hotAmericano: return "핫 아메리카노"
        case .cafeLatte: return "카페라떼"
        case .coldBrew: return "콜드브루"
        }
    }

    var price: Int {
        switch self {
        case .iceAmericano: return 4500
        case .hotAmericano: return 4200
        case .cafeLatte: return 4600
        case .coldBrew: return 4500
        }
    }
}


var misterLee: Person = Person(money: 10000)
var paulBasset: Person = Person(money: 10000)
var missKim: Person = Person(money: 9000)

var yagombucks: CoffeeShop = CoffeeShop()
var luciebucks: CoffeeShop = CoffeeShop()


missKim.order(_ Coffee: [.iceAmericano, .coldBrew], of CoffeeShop: yagombucks, by name: paulBasset)
