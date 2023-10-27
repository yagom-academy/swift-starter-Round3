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
    
    mutating func buyCoffee(order: [Coffee], of coffeeShop: CoffeeShop) {
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
    
    mutating func receiveOrder(order: [Coffee], by person: Person) {
        print("\(order) 메뉴의 주문이 들어왔습니다.")
        //salesVolume에 totalPrice를 더한다.
        //makeCoffee를 시작한다.
    }
    mutating func makeCoffee(order: [Coffee], by person: Person) {
        pickupTable = [order]
        print("\(person.name)님이 주문하신 \(pickupTable)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
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


var misterLee: Person = Person(name: "misterLee", money: 10000)
var paulBasset: Person = Person(name: "paulBasset", money: 10000)
var missKim: Person = Person(name: "missKim", money: 9000)

var yagombucks: CoffeeShop = CoffeeShop()
var luciebucks: CoffeeShop = CoffeeShop()

yagombucks.barista = misterLee

missKim.buyCoffee(order: [.iceAmericano, .coldBrew], of: yagombucks)
