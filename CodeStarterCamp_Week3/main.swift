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
    
    func order(coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let buyCoffee = coffeeShop.menu[coffee] {
            if money < buyCoffee {
                print("잔액이 \(buyCoffee - money)원만큼 부족합니다.")
            }
            else {
                coffeeShop.make(coffee: coffee, for: name)
                money -= buyCoffee
            }
        }
    }
}

class CoffeeShop {
    var barista: Person?
    var sales: Int
    let menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee> = []
    
    init(sales: Int, menu: Dictionary<Coffee, Int>, pickUpTable: Array<Coffee>) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func make(coffee: Coffee, for name: String) {
        if let earnMoney = menu[coffee] {
            sales += earnMoney
        }
        
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case vanillaLatte = "바닐라 라떼"
    case cappuccino = "카푸치노"
    case einspanner = "아인슈페너"
}

let missKim: Person = Person(money: 2000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, menu: [.espresso : 2000, .americano : 3000, .cafeLatte : 4000, .vanillaLatte : 4500, .cappuccino : 4000], pickUpTable: [])
missKim.order(coffee: .americano, of: yagombucks, by: "missKim")
missKim.money += 20000
missKim.order(coffee: .americano, of: yagombucks, by: "missKim")
print(missKim.money)
print(yagombucks.sales)
