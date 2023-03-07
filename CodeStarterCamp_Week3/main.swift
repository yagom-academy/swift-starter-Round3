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
            return "아메리카노"
        case .latte:
            return "라떼"
        case .javachipFrappuccino:
            return "자바칩프라푸치노"
        case .caramelMacchiato:
            return "카라멜마끼아또"
        }
    }
}

struct Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(name)은 가지고 있는 \(money)원으로 \(coffeeShop.coffeeShopName)에서 \(coffeeShop.barista.name)가 만들어주는 \(coffeeShop.menu.keys)를 \(coffeeShop.menu.values)원을 주고 커피를 구매했다")
    }
}

struct CoffeeShop {
    var coffeeShopName: String
    var sales: Int
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    
    init(coffeeShopName: String, sales: Int, barista: Person, menu: [Coffee : Int], pickUpTable: [Coffee]) {
        self.coffeeShopName = coffeeShopName
        self.sales = sales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    mutating func orderingCoffee(menus:Coffee) {
        print("\(menus)주문 받았습니다.")
        if let price = menu[menus] {
            print("주문하신 \(menus)의 가격은\(price)입니다.")
            sales += price
        }
        pickUpTable.append(menus)
    }
    
    func coffeePickupTable() {
        print("테이블에는 \(pickUpTable)의 커피가 있습니다.")
    }
}
var missKim = Person(name: "missKim", money: 9700)
var misterLee = Person(name: "misterLee", money: 9700)
missKim.buyCoffee(coffeeShop: CoffeeShop(coffeeShopName: "오뚜기", sales: 200, barista: misterLee, menu: [.americano: 1500, ], pickUpTable: []), coffee: .americano)

var yagombucks = CoffeeShop(coffeeShopName: "yagombucks", sales: 0, barista: misterLee,
                            menu: [.americano: 2000, .latte: 2900, .javachipFrappuccino: 4500, .caramelMacchiato: 3500],
                            pickUpTable: [])
yagombucks.orderingCoffee(menus: .americano)
yagombucks.orderingCoffee(menus: .javachipFrappuccino)
yagombucks.coffeePickupTable()
