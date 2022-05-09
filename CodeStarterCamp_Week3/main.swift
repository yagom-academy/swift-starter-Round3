//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func buyCoffee(coffee: coffeeMenu) {
        print("\(coffee)를 구매합니다.")
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [coffeeMenu?: Int]
    
    init(sales: Int, menu: [coffeeMenu?: Int], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.barista = barista
    }
    
    func order(coffee: coffeeMenu) {
        print("\(coffee)를 주문받습니다.")
    }
    
    func makeCoffee() {
        print("커피를 만듭니다.")
    }
}

enum coffeeMenu {
    case 아메리카노, 카페라떼, 카페모카, 에스프레소, 카라멜마끼야또
}

let misterLee: Person = Person(money: 10000, name: "misterLee")
let missKim: Person = Person(money: 0, name: "missKim")
let yagombucks = CoffeeShop(sales: 0, menu: [.카라멜마끼야또: 3800, .카페모카: 3500, .카페라떼: 3000, .아메리카노: 2500, .에스프레소: 2500], barista: misterLee)
