//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case caffeMocha = "카페모카"
    case latte = "라떼"
    case caramelMacchiato = "카라멜 마키아또"
}

struct Person {
    let name: String
    var money: Int
    
    mutating func order(coffee: Coffee, in coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if money < coffeePrice {
                print("돈이 부족합니다")
            } else {
                money -= coffeePrice
                print("결제 완료됐습니다.")
            }
        } else {
            print("존재하지 않는 메뉴입니다")
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = [] {
        willSet {
            print("주문하신 커피가 완성되었습니다")
        }
        didSet {
            print("주문하신 커피가 나왔습니다")
        }
    }
    var barista: Person
    
    init(menu: [Coffee : Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func take(order: Coffee) {
        print("주문이 완료되었습니다")
        make(coffee: order)
    }
    
    func make(coffee: Coffee) {
        pickUpTable.append(coffee)
    }
}

var misterLee = Person(name: "Lee", money: 20000)
var missKim = Person(name: "Kim", money: 30000)

var yagombucks = CoffeeShop(menu: [Coffee.americano: 2500, Coffee.caramelMacchiato: 3500, Coffee.latte: 3000, Coffee.caffeMocha: 3000], barista: misterLee)
