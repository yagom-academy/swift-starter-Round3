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
    case latte = "라떼"
    case mocha = "카페모카"
    case espresso = "에스프레소"
}

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        let coffeePrice = coffeeShop.menu[coffee.rawValue] ?? 0
        if money < coffeePrice {
            print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
        } else {
            money -= coffeePrice
            coffeeShop.make(coffee, for: name)
        }
    }
}

class CoffeeShop {
    var shopName: String
    var sales: Int = 0
    var barista: String
    var menu: [Coffee.RawValue: Int] = ["아메리카노": 2000, "라떼": 2500, "카페모카": 3000, "에스프레소": 1500]
    var pickUpTable: [Coffee] = [Coffee]()
    
    init(shopName: String, barista: String) {
        self.shopName = shopName
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        let coffeePrice = menu[coffee.rawValue] ?? 0
        sales += coffeePrice
        pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

let missKim: Person = Person(name: "김민지", money: 3000)
let yagombucks: CoffeeShop = CoffeeShop(shopName: "야곰벅스", barista: "바리스타")

print(yagombucks.menu)
print("\(missKim.name)님의 현재 잔액은 \(missKim.money)원 입니다.")
missKim.order(.americano, of: yagombucks, by: missKim.name)
print("\(missKim.name)님의 현재 잔액은 \(missKim.money)원 입니다.")
print("\(yagombucks.shopName)의 현재 총 매출액은 \(yagombucks.sales)원 입니다.")
