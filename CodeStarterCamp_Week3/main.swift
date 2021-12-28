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
    mutating func buy(coffee: Coffee, shop: CoffeeShop) {
        print("\(self.name): \(coffee) 주세요.")
        shop.takeOrder(coffee: coffee, customer: self)
        if money < coffee.cost {
            let lackOfCost = coffee.cost - money
            print("잔액이 \(lackOfCost)원만큼 부족합니다. ")
        } else {
            self.money -= coffee.cost
        }
    }
}

enum Coffee {
    case espresso
    case americano
    case cafeLatte
    case cafeMocha
    case flatWhite
    
    var cost: Int {
        switch self {
        case .espresso:
            return 3000
        case .americano:
            return 4000
        case .cafeLatte:
            return 5000
        case .cafeMocha:
            return 5000
        case .flatWhite:
            return 5000
        }
    }
}

class CoffeeShop {
    var brista: Person
    var customer: Person?
    var menuBoard: Coffee = .americano
    var salesRevenue = 0
    var pickUpTable: String? = nil {
        didSet {
            if let customer = customer {
                print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
    init(brista: Person) {
           self.brista = brista
    }

    func takeOrder(coffee: Coffee, customer: Person) {
        self.customer = customer
        let costOfcoffee = coffee.cost
        print("\(self.brista.name): \(coffee)는 \(costOfcoffee)원 입니다.")
        salesRevenue += costOfcoffee
        makeCoffees(coffee: coffee)
    }
    func makeCoffees(coffee: Coffee) {
        print("\(coffee)를 만드는 중 입니다.")
        pickUpTable = "\(coffee)"
    }
}

var misterLee = Person(name: "Lee", money: 10000)
var missKim = Person(name: "Kim", money: 10000)
var yagombucks = CoffeeShop(brista: misterLee)

missKim.buy(coffee: .americano, shop: yagombucks)
