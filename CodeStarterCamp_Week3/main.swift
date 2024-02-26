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
    
    mutating func buyCoffee(_ coffee: Coffee, at cafe: CoffeeShop) {
        if coffee.price > cash {
            print("잔액이 부족합니다.")
        } else {
            cash -= coffee.price
            print("\(coffee.rawValue) 주문에 성공했습니다.")
            cafe.takeOrder(coffee, by: self)
        }
    }
}

class CoffeeShop {
    var name: String
    var sales: Int
    var barista: Person!
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
    
    func takeOrder(_ coffee: Coffee, by customer: Person) {
        print("\(customer.name) 고객님의 주문 : \(coffee.rawValue)")
        self.sales += coffee.price
        self.makeCoffee(coffee, by: self.barista)
    }
    
    func makeCoffee(_ order: Coffee, by barista: Person) {
        print("\(order.rawValue)가 완성되었습니다.")
        pickUpTable.append(order)
    }
}

enum Coffee: String, CaseIterable {
    case espresso
    case americano
    case latte
    case cappuccino
    case macchiato
    
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

var missKim = Person(name: "Kim", cash: 30000)
let misterLee = Person(name: "Lee")
let yagombucks = CoffeeShop(name: "yagombucks")
yagombucks.barista = misterLee
missKim.buyCoffee(.americano, at: yagombucks)
