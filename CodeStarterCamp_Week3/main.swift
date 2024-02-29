//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct Person {
    var name: String
    var cash: Int
    
    init(name: String, cash: Int = 0) {
        self.name = name
        self.cash = cash
    }
    
    mutating func order(_ coffee: Coffee, of cafe: CoffeeShop) {
        if coffee.price > cash {
            print("잔액이 \(coffee.price - cash)원만큼 부족합니다.")
        } else {
            cash -= coffee.price
            print("\(coffee.rawValue) 주문에 성공했습니다.")
            cafe.make(coffee, from: self.name)
        }
    }
}

class CoffeeShop {
    var name: String
    var sales: Int
    var barista: Person?
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    
    init(name: String, sales: Int = 0) {
        self.name = name
        self.sales = sales
        self.menu = [:]
        self.pickUpTable = []
        
        Coffee.allCases.forEach { coffee in
            self.menu[coffee] = coffee.price
        }
    }
    
    func make(_ coffee: Coffee, from name: String) {
        sales += coffee.price
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String, CaseIterable {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case latte = "카페라떼"
    case cappuccino = "카푸치노"
    case macchiato = "마끼아또"
    
    var price: Int {
        switch self {
        case .espresso: 4000
        case .americano: 4500
        case .latte: 5000
        case .cappuccino: 5000
        case .macchiato: 5500
        }
    }
}

var missKim = Person(name: "missKim", cash: 10000)
let yagombucks = CoffeeShop(name: "yagombucks")
missKim.order(.americano, of: yagombucks)
