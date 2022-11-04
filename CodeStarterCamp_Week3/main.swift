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
    
    mutating func order(_ coffee: [Coffee], at cafe: inout CoffeeShop) {
        var total = 0
        for menu in coffee {
            total += menu.price
        }
        
        let balanceCheck = self.money - total
        
        if balanceCheck >= 0 {
            self.money = balanceCheck
            cafe.make(coffee, from: self.name)
        } else {
            print("잔액이 \(-balanceCheck)원만큼 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var revenue: Int = 0
    var menuList: Dictionary<Coffee, Int> = [:]
    var barista: Person
    var customer: String?
    var pickUpTable: Array<Coffee> = [] {
        didSet {
            if let name = self.customer {
                print("\(name) 님이 주문하신", terminator: " ")
            }
            
            for menu in pickUpTable {
                if menu != pickUpTable[pickUpTable.count - 1] {
                    print("\(menu.rawValue)", terminator: ", ")
                } else {
                    print("\(menu.rawValue)", terminator: "(이/가) 준비되었습니다. 픽업대에서 가져가주세요. \n")
                }
            }
            
            pickUpTable.removeAll()
            customer = nil
        }
    }
    
    mutating func appendCoffeeMenu() {
        for menu in Coffee.allCases {
            menuList[menu] = menu.price
        }
    }
    
    mutating func make(_ coffee: [Coffee], from name: String) {
        customer = name
        for member in coffee {
            self.revenue += member.price
        }
        
        pickUpTable = coffee
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
}

var misterLee = Person(name: "misterLee",age: 27, money: 100000)
var missKim = Person(name: "missKim", age: 30, money: 7500)
var yagombucks = CoffeeShop(barista: misterLee)

yagombucks.appendCoffeeMenu()

missKim.order([.americano], at: &yagombucks)
missKim.order([.lemonade], at: &yagombucks)

print(yagombucks.revenue)

missKim.money = 24000
missKim.order([.americano, .blackTea, .greenTea], at: &yagombucks)

print(yagombucks.revenue)
