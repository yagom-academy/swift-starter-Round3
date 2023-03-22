//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: CustomStringConvertible {
    case americano
    case latte
    case mocha
    case espresso
    
    var description: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .latte:
            return "라떼"
        case .mocha:
            return "카페모카"
        case .espresso:
            return "에스프레소"
        }
    }
}

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        guard let coffeePrice = coffeeShop.menu[coffee] else {
            return
        }
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
    var barista: Person
    var menu: [Coffee: Int] = [.americano: 2000, .latte: 2500, .mocha: 3000, .espresso: 1500]
    var pickUpTable: [Coffee] = []
    
    init(shopName: String, barista: Person) {
        self.shopName = shopName
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        guard let coffeePrice = menu[coffee] else {
            return
        }
        sales += coffeePrice
        pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

let missKim: Person = Person(name: "김민지", money: 3000)
let baristakim: Person = Person(name: "바리스타", money: 0)
let yagombucks: CoffeeShop = CoffeeShop(shopName: "야곰벅스", barista: baristakim)

print(yagombucks.menu)
print("\(missKim.name)님의 현재 잔액은 \(missKim.money)원 입니다.")
missKim.order(.americano, of: yagombucks)
print("\(missKim.name)님의 현재 잔액은 \(missKim.money)원 입니다.")
print("\(yagombucks.shopName)의 현재 총 매출액은 \(yagombucks.sales)원 입니다.")
