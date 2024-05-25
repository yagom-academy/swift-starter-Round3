//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var money: Int {
        didSet {
            print("\(name)의 잔액이 \(oldValue)원에서 \(money)원으로 감소했습니다.")
        }
    }
    
    init(name: String, money: Int = 0) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("\(coffee.name)는 \(coffeeShop.shopName)에 없는 메뉴입니다.")
            return
        }
        if price > self.money {
            print("\(name)의 잔액이 \(price - self.money)원 부족합니다.")
            return
        }
        print("\(name)(이)가 \(coffeeShop.shopName)에서 \(coffee.name)를 주문했습니다.")
        self.money -= price
        coffeeShop.make(coffee, from: self)
    }
}

class CoffeeShop {
    var shopName: String
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [(Person, Coffee)] {
        didSet {
            print("\(pickUpTable.last!.0.name)님이 주문하신 \(pickUpTable.last!.1.name)가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    var sales: Int {
        didSet {
            print("\(shopName)의 매출액이 \(oldValue)원에서 \(sales)원으로 증가했습니다.")
        }
    }
    
    init(shopName: String, barista: Person, menu: [Coffee : Int], pickUpTable: [(Person, Coffee)] = [], sales: Int = 0) {
        self.shopName = shopName
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.sales = sales
    }
    
    func make(_ coffee: Coffee, from customer: Person) {
        guard let price = self.menu[coffee] else {
            print("\(coffee.name)는 \(self.shopName)에 없는 메뉴입니다.")
            return
        }
        sales += price
        
        print("\(shopName)의 바리스타 \(barista.name)가 \(coffee.name)를 만드는 중입니다.")
        pickUpTable.append((customer, coffee))
    }
}

enum Coffee {
    case Espresso
    case Americano
    case CafeLatte
    case VanillaLatte
    case CaramelMacchiato
    case CafeMocha
    
    var name: String {
        switch self {
        case .Espresso:
            "에스프레소"
        case .Americano:
            "아메리카노"
        case .CafeLatte:
            "카페라떼"
        case .VanillaLatte:
            "바닐라라떼"
        case .CaramelMacchiato:
            "카라멜마끼아또"
        case .CafeMocha:
            "카페모카"
        }
    }
}

let misterLee = Person(name: "Lee")
let missKim = Person(name: "Kim", money: 10000)
let mango = Person(name: "Mango", money: 7000)

let yagombucks = CoffeeShop(shopName: "야곰벅스", barista: misterLee, menu: [Coffee.Espresso: 3000, Coffee.Americano: 4000, Coffee.CafeLatte: 5000, Coffee.VanillaLatte: 6000])

missKim.order(Coffee.Americano, of: yagombucks)
mango.order(Coffee.VanillaLatte, of: yagombucks)
