//
//  Type.swift
//  CodeStarterCamp_Week3
//
//  Created by Jungmo Yu on 2021/12/24.
//

import Foundation

struct Person {
    var name: String
    var money: UInt
    
    func buySomething() {
        print("\(self.name) buy something!")
    }
}

class CoffeeShop {
    var sales: UInt
    var barista: Person?
    var menu: [Coffee]
    let pickUpTable: String = "This is pick up table!"
    
    init() {
        self.sales = 0
        self.menu = [.americano, .cafeLatte]
    }
    
    func takeOrder(item: Coffee?) {
        if case .some(let orderedItem) = item {
            print(orderedItem)
        } else { print("주문을 받지 않았습니다.") }
    }
    
    func makeCoffee() {
        
    }
}


enum Coffee {
    case americano
    case cafeLatte
    case cappuccino
    case hotChocolate
    
    var price: UInt {
        get {
            switch self {
            case .americano: return 4500
            case .cafeLatte: return 5500
            case .cappuccino: return 6000
            case .hotChocolate: return 5000
            }
        }
    }
}

