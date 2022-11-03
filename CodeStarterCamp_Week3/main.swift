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
    
    mutating func order(_ coffee: Coffee) {
        let balanceCheck: Int = self.money - coffee.price
        
        if balanceCheck >= 0 {
            self.money = balanceCheck
            yagombucks.make(coffee, from: self.name)
        } else {
            print("잔액이 \(-balanceCheck)만큼 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var revenue: Int = 0
    var menuList: Dictionary<Coffee, Int> = [:]
    var barista: Person
    var nameOfOrderedPerson: String?
    var pickUpTable: Coffee? {
        didSet {
            if let menu = self.pickUpTable, let name = self.nameOfOrderedPerson {
                print("\(name) 님이 주문하신 \(menu.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
    mutating func appendCoffeeMenu() {
        for menu in Coffee.allCases {
            menuList[menu] = menu.price
        }
    }
    
    mutating func make(_ coffee: Coffee, from name: String) {
        nameOfOrderedPerson = name
        self.revenue += coffee.price
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

missKim.order(.americano)
missKim.order(.lemonade)

