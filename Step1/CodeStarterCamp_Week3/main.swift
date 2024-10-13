//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case americano = "Americano"
    case latte = "Latte"
    case cappuccino = "Cappuccino"
    case espresso = "Espresso"
}

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffee: Coffee, from coffeeShop: CoffeeShop) {
        if let price = coffeeShop.menu[coffee], money >= price {
            money -= price
            coffeeShop.makeCoffee(coffee: coffee)
            print("\(name) 님이 \(coffee.rawValue)를 구매했습니다.")
        } else {
            print("\(name) 님은 돈이 부족하거나, 메뉴에 없는 커피입니다.")
        }
    }
}

class CoffeeShop {
    var menu: [Coffee: Int]
    var sales: Int = 0
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    init(menu: [Coffee: Int]) {
        self.menu = menu
    }
    
    func makeCoffee(coffee: Coffee) {
        pickUpTable.append(coffee)
        if let price = menu[coffee] {
            sales += price
        }
        print("\(coffee.rawValue)가 만들어졌습니다.")
    }
}

let misterLee = Person(name: "Mister Lee", money: 10000)
let missKim = Person(name: "Miss Kim", money: 5000)

let yagombucks = CoffeeShop(menu: [.americano: 4000, .latte: 4500, .cappuccino: 5000, .espresso: 3000])

//바리스타 이름
yagombucks.barista = misterLee

missKim.buyCoffee(coffee: .latte, from: yagombucks)
misterLee.buyCoffee(coffee: .americano, from: yagombucks)

print("현재 yagombucks의 매출: \(yagombucks.sales)원")
print("픽업 테이블에 있는 커피: \(yagombucks.pickUpTable.map { $0.rawValue })")
