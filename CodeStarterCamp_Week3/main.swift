//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - STEP 1

struct Person {
    var name: String
    var age: Int
    var money: Int
    
    func orderCoffee(_ menu: String) -> String {
        return menu
    }
    
}

struct CoffeShop {
    var revenue: Int?
    var menuList: Dictionary<Coffee, Int> = [:]
    var pickUpTable: Array<Coffee> = []
    var barista: Person
    
    mutating func appendCoffeeMenu(_ name: Coffee, price: Int) {
        let name = name
        let price = price
        
        menuList[name] = price
    }
    
    mutating func makeCoffee(_ order: Coffee) {
        pickUpTable.append(order)
    }
}

enum Coffee: String {
    case americano = "아메리카노", cafeLatte = "카페라떼", blackTea = "홍차",
         lemonade = "레모네이드", espresso = "에스프레소", cafeMocca = "카페모카",
         smothie = "스무디", greenTea = "녹차"
}


var misterLee = Person(name: "misterLee",age: 27, money: 100000)
var missKim = Person(name: "missKim", age: 30, money: 150000)
var yagombucks = CoffeShop(barista: misterLee)

// yagombucks 메뉴 할당
yagombucks.appendCoffeeMenu(.americano, price: 4500)
yagombucks.appendCoffeeMenu(.blackTea, price: 3500)
yagombucks.appendCoffeeMenu(.espresso, price: 3000)
yagombucks.appendCoffeeMenu(.cafeLatte, price: 5000)

print(yagombucks.barista.name)

func checkMenuOfyagombucks(menu: Coffee) {
    if let price = yagombucks.menuList[menu] {
        print("\(menu.rawValue)는 \(price)원 입니다.")
    } else {
        print("해당 메뉴는 yagombucks에 없는 메뉴입니다.")
    }
}

checkMenuOfyagombucks(menu: .americano)
checkMenuOfyagombucks(menu: .cafeMocca)
checkMenuOfyagombucks(menu: .cafeLatte)
