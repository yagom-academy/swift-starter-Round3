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
    
    init(money: Int) {
        self.money = money
    }
    
    func buyCoffee(_ coffeeMenu: Coffee, _ coffeShop: CoffeShop) {
        if let data = coffeShop.menu[coffeeMenu] {
                money = money - data
        }
        coffeShop.orderCoffee(coffeeMenu)
    }
}

class CoffeShop {
    var sales: Int
    var barista: Person?
    var pickUpTable: Bool = false
    let menu: [Coffee: Int] = [Coffee.espresso: 100, Coffee.americano: 200, Coffee.macchiato: 300,
                               Coffee.cappuccino: 400, Coffee.caffeLatte: 500, Coffee.affogato: 600]
    
    init(sales: Int) {
        self.sales = sales
    }
    
    func orderCoffee(_ coffee: Coffee) {
        pickUpTable = true
        print("\(coffee.rawValue)가 주문되엇습니다.")
    }
}

enum Coffee: String{
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case macchiato = "마끼아또"
    case cappuccino = "카푸치노"
    case caffeLatte = "카페라떼"
    case affogato = "아포가토"
}

var missKim: Person = Person(money: 10000)
var misterLee: Person = Person(money: 4000)

var yagombucks: CoffeShop = CoffeShop(sales: 0)

yagombucks.barista = misterLee

missKim.buyCoffee(Coffee.espresso, yagombucks)


