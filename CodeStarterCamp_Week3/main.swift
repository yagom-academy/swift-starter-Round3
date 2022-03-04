//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: CaseIterable {
    case americano
    case latte
    case espresso
    
    var price: Int {
        switch self {
        case .espresso:
            return 3800
        case .americano:
            return 4100
        case .latte:
            return 4500
        }
    }
}

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, from coffeeShop: CoffeeShop) {
        if Coffee.allCases.contains(coffee) {
            let hasEnoughMoney = self.money >= coffee.price
            guard hasEnoughMoney else {
                print("잔액이 \(coffee.price-self.money)원만큼 부족합니다.")
                return
            }
            self.money -= coffee.price
            print("결제가 완료되었습니다. 잔액은 \(self.money)원입니다.")
            coffeeShop.takeOrder(coffee: coffee, from: self)
        }
        else {
            print("죄송합니다. 주문하신 \(coffee)는 판매하지 않습니다.")
        }
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 10000)

class CoffeeShop {
    var sales: Int = 0
    let menu: [Coffee] = Coffee.allCases
    var customer: String = ""
    var pickUpTable: [Coffee] = [] {
        didSet {
            print("\(customer)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    let barista: Person
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee, from person: Person) {
        sales += coffee.price
        makeCoffee(coffee: coffee, to: person)
        
    }
    
    func makeCoffee(coffee: Coffee, to person: Person) {
        customer = person.name
        pickUpTable.append(coffee)
    }
}

var yagombucks = CoffeeShop(barista: misterLee)

missKim.buy(coffee: Coffee.americano, from: yagombucks)
