//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        coffeeShop.make(coffee, from: self)
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
}

class CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    var barista: Person
    
    func make(_ coffee: Coffee, from person: Person) {
        guard let menuPrice = menu[coffee] else {
            print("주문하신 메뉴는 매장에서 판매하지 않는 제품입니다")
            return
        }
        
        if person.money - menuPrice < 0 {
            print("잔액이 \(menuPrice - person.money)원만큼 부족합니다.")
        } else {
            pickUpTable.append(coffee)
            
            sales += menuPrice
            person.money -= menuPrice
            
            print("\(person.name) 잔액: \(person.money)원")
            print("주문하신 \(coffee.rawValue)(이/가) 준비 되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    init(sales: Int, menu: [Coffee : Int], pickUpTable: [Coffee], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case espresso = "에스프레소"
    case mocha = "카페모카"
    case latte = "카페라떼"
    case cappuccino = "카푸치노"
    case greenTea = "그린티"
    case iceTea = "아이스티"
}

let missKim: Person = Person(name: "missKim", money: 6000)
let misterLee: Person = Person(name: "misterLee", money: 12000)
let yagombucksMenu: [Coffee: Int] = [.americano: 4500, .cappuccino: 5500, .espresso: 4000, .mocha: 5500, .latte: 5000, .greenTea: 6500, .iceTea: 5000]
let yagombucks: CoffeeShop = CoffeeShop(sales: 0, menu: yagombucksMenu, pickUpTable: [], barista: misterLee)

missKim.order(.mocha, of: yagombucks)

