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
    
    mutating func buyCoffee(order: [Coffee], of coffeeShop: inout CoffeeShop) {
        var totalPrice = 0
        for coffee in order {
            totalPrice += coffee.price
        }
        
        if money >= totalPrice
        {
            print("\(name) : \(order.map { $0.name }.joined(separator: ", ")) 주문이요!")
            print("(\(name) : 주머니에 있는 \(money)원에서 \(totalPrice)원을 지불합니다.)")
            self.money -= totalPrice
            print("(\(name) : 현재 제 주머니에는 \(money)원이 남아있네요.)")
            coffeeShop.receiveOrder(order: order, by: self, totalPrice: totalPrice)
        }
        else
        {
            print("\(name) : \(order.map { $0.name }.joined(separator: ", ")) 주문이요!")
            let neededMoney = totalPrice - money
            print("잔액이 \(neededMoney)원만큼 부족합니다.\n")
        }
    }
}

struct CoffeeShop {
    var salesVolume: Int = 0
    let menu: [Coffee] = [.iceAmericano, .hotAmericano, .cafeLatte, .coldBrew]
    var pickupTable: [Coffee] = []
    var barista: Person!
    
    mutating func receiveOrder(order: [Coffee], by person: Person, totalPrice: Int) {
        print("\(order.map { $0.name }.joined(separator: ", ")) 메뉴의 주문이 들어왔습니다.")
        salesVolume += totalPrice
        print("(\(barista.name) : 좋아. 오늘의 총 매출은 \(salesVolume)원이군.)")
        
        makeCoffee(order: order, by: person)
    }
    mutating func makeCoffee(order: [Coffee], by person: Person) {
        pickupTable = order
        print("\(person.name)님이 주문하신 \(pickupTable.map { $0.name }.joined(separator: ", "))(이/가) 준비되었습니다. 픽업대에서 가져가주세요.\n")
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
var lucieNa: Person = Person(name: "lucieNa", money: 15000)

var yagombucks: CoffeeShop = CoffeeShop()
var luciebucks: CoffeeShop = CoffeeShop()

yagombucks.barista = misterLee
luciebucks.barista = paulBasset


missKim.buyCoffee(order: [.iceAmericano, .hotAmericano], of: &yagombucks)
lucieNa.buyCoffee(order: [.iceAmericano, .hotAmericano, .coldBrew], of: &yagombucks)
paulBasset.buyCoffee(order: [.iceAmericano], of: &yagombucks)
misterLee.buyCoffee(order: [.iceAmericano, .hotAmericano], of: &luciebucks)
misterLee.buyCoffee(order: [.iceAmericano], of: &luciebucks)
