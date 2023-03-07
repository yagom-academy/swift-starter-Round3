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
    case javachipFrappuccino
    case caramelMacchiato
    
    var description: String {
        switch self {
        case .americano:
            return "americano"
        case .latte:
            return "latte"
        case .javachipFrappuccino:
            return "javachipFrappuccino"
        case .caramelMacchiato:
            return "caramelMacchiato"
        }
    }
}

struct Price {
    var price: Int
    
    init(price: Int) {
        self.price = price
    }
}

struct Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop) {
        print("\(name)은 가지고 있는 \(money)원으로 \(coffeeShop.coffeeShopName)에서 \(coffeeShop.barista)가 만들어주는 커피를 \(coffeeShop.menu)원을 주고 커피를 구매했다")
    }
}

struct CoffeeShop {
    var coffeeShopName: String
    var sales: Int?
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    
    init(coffeeShopName: String, sales: Int? = nil, barista: Person, menu: [Coffee : Int], pickUpTable: [Coffee]) {
        self.init(coffeeShopName: coffeeShopName, barista: barista, menu: menu, pickUpTable: pickUpTable)
        self.sales = sales
    }
    init(coffeeShopName: String, barista: Person, menu: [Coffee: Int], pickUpTable: [Coffee]) {
        self.coffeeShopName = coffeeShopName
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    mutating func orderingCoffee(menus:Coffee, menu: [Coffee: Int]) {
        print("\(menus)주문 받았습니다.  \(menu.values)원 입니다.")
        print("\(menus)을 만들고 있습니다.")
        pickUpTable.append(menus)
    }
    
    func makingCoffee() {
        print("주문하신 \(pickUpTable)나왔습니다 테이블에서 가져가주세요")
    }
}
var missKim = Person(name: "missKim", money: 9700)
var misterLee = Person(name: "misterLee", money: 9700)
missKim.buyCoffee(coffeeShop: CoffeeShop(coffeeShopName: "오뚜기", barista: misterLee, menu: [.americano: 1500], pickUpTable: []))

var yagombucks = CoffeeShop(coffeeShopName: "yagombucks", barista: misterLee, menu: [.caramelMacchiato: 5000], pickUpTable: [])
yagombucks.orderingCoffee(menus: .caramelMacchiato, menu: [.caramelMacchiato: 2100])
yagombucks.makingCoffee()
print(" 픽업 테이블에는\(yagombucks.pickUpTable)")
