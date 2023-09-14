//
//  STEP1.swift
//  CodeStarterCamp_Week3
//
//  Created by DOYEON JEONG on 2023/09/14.
//

import Foundation

//class Person {
//    let name: String
//    var money: Int
//    
//    init(name: String, money: Int) {
//        self.name = name
//        self.money = money
//    }
//    
//    func buy(_ coffee: Coffee, of shop: CoffeeShop) {
//        guard let price = shop.menu[coffee], money >= price else {
//            print("돈이 부족하거나 메뉴에 없는 커피입니다.")
//            return
//        }
//        shop.order(coffee)
//        money -= price
//    }
//}
//
//class CoffeeShop {
//    var revenue: Int = 0
//    var menu: [Coffee : Int]
//    var barista: Person
//    var pickUpTable: [String] = []
//    
//    init(barista: Person, menu: [Coffee :Int]) {
//        self.barista = barista
//        self.menu = menu
//    }
//    
//    func order(_ coffee: Coffee) {
//        guard let price = self.menu[coffee] else { return }
//        revenue += price
//        make(coffee)
//    }
//    
//    private func make(_ coffee: Coffee) {
//        pickUpTable.append(coffee.rawValue)
//    }
//}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case cappuccino = "카푸치노"
    case mocha  = "모카"
}
