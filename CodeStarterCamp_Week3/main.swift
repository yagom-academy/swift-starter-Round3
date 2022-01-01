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
    mutating func buy(coffee: Coffee , shop: CoffeeShop) {
        print("\(self.name): \(coffee)를 주세요 ")
        shop.takeOrder(coffee: coffee, customer: self)
        if money < coffee.cost {
            let insufficientOfcost = coffee.cost - money
            print("잔액이 \(insufficientOfcost)원 만큼 부족 합니다")
        }else {
            money -= coffee.cost
        }
    }
}

enum Coffee: CaseIterable {
    case espresso, americano, cafeLatte, vanillaLatte, caramelMacchiato, cafeMocha, affogato
    
    var cost: Int {
        switch self {
        case .espresso:
            return 3000
        case .americano:
            return 4500
        case .cafeLatte:
            return 5000
        case .vanillaLatte:
            return 5500
        case .caramelMacchiato:
            return 5500
        case .cafeMocha:
            return 5700
        case .affogato:
            return 6000
        }
    }
}

class CoffeeShop {
    var barista: Person
    var customer: Person?
    var menuBoard = Coffee.allCases
    var salesRevenue = 0
    var pickUpTable: String? = nil {
        didSet {
            if let customer = customer {
                print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
            }
        }
    }
    
    init(barista: Person){
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee, customer: Person) {
        self.customer = customer
        let costOfMenu = coffee.cost
        print("\(self.barista.name): \(coffee)는 \(costOfMenu)원입니다 ")
        salesRevenue += costOfMenu
        makeCoffees(coffee: coffee)
    }
    
    func makeCoffees(coffee: Coffee) {
        print("\(coffee)를 만드는 중 입니다.!!!")
        pickUpTable = "\(coffee)"
    }
}

var misterLee = Person(name: "Lee", money: 20000)
var missKim = Person(name: "Kim", money: 15000)
var yagombucks = CoffeeShop(barista: misterLee)

missKim.buy(coffee: .vanillaLatte, shop: yagombucks)

