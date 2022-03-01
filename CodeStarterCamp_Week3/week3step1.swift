//
//  Step 1.swift
//  CodeStarterCamp_Week3
//
//  Created by Minseong Kang on 2022/03/01.
//

import Foundation

class Person {
    var name: String
    var money: Int
    var inventory: Array<String> = []
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ something: String) {
        self.inventory.append(something)
        print("\(self.name)의 인벤토리에 \(something) 이/가 추가되었습니다.")
    }
}

class CoffeeShop {
    var salesRevenue: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: Array<String> = []
    var baristas: Array<Person> = []
    
    init(baristas: Array<Person>, menu: [Coffee: Int]) {
        self.baristas = baristas
        self.menu = menu
    }
    
    func order(coffee: String) -> String {
        print("\(coffee) 주문 접수가 완료되었습니다.")
        return coffee
    }
    
    func make(_ what: String) {
        pickUpTable.append(what)
        print("주문하신 \(what) 나왔습니다.")
    }
}

enum Coffee {
    case espresso
    case americano
    case latte
    case cappuccino
    
    var name: String {
        switch self {
        default:
            return "\(self)"
        }
    }
}
