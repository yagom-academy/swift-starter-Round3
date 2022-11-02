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

struct CoffeeShop {
    var revenue: Int?
    var menuList: Dictionary<Coffee, Int> = [:]
    var pickUpTable: Array<Coffee> = []
    var barista: Person
    
    mutating func appendCoffeeMenu() {
        for menu in Coffee.allCases {
            menuList[menu] = menu.returnPrice()
        }
    }
    
    mutating func makeCoffee(_ order: Coffee) {
        pickUpTable.append(order)
        print("주문하신 \(order.rawValue) 나왔습니다!")
    }
}

enum Coffee: String, CaseIterable {
    case americano = "아메리카노", cafeLatte = "카페라떼", blackTea = "홍차",
         lemonade = "레모네이드", espresso = "에스프레소", cafeMocca = "카페모카",
         smothie = "스무디", greenTea = "녹차"
    
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .cafeLatte:
            return 4500
        case .blackTea:
            return 3500
        case .lemonade:
            return 5000
        case .espresso:
            return 2500
        case .cafeMocca:
            return 4500
        case .smothie:
            return 5500
        case .greenTea:
            return 3500
        }
    }
    
    func returnPrice() -> Int {
        return self.price
    }
}

var misterLee = Person(name: "misterLee",age: 27, money: 100000)
var missKim = Person(name: "missKim", age: 30, money: 150000)
var yagombucks = CoffeeShop(barista: misterLee)

// yagombucks 메뉴 할당
yagombucks.appendCoffeeMenu()

// barista 이름 확인
print(yagombucks.barista.name)

// yagombucks 메뉴가 잘 할당되었는지 확인
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

// makeCoffee 메서드 확인
yagombucks.makeCoffee(.americano)
print(yagombucks.pickUpTable[0].rawValue)
