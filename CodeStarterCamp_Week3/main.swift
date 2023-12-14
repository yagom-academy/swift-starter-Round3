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
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeshopName: CoffeeShop, menuName: Coffee) {
        var coffeePrice: Int = coffeeshopName.order(menuName: menuName, customerMoney: self.money)
        self.money = self.money - coffeePrice
        print(self.money)
    }
}

class CoffeeShop {
    var name: String
    var barista: Person
    var totalMoney: Int
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee> = []
    
    init(name: String, barista: Person, totalMoney: Int, menu: Dictionary<Coffee, Int>) {
        self.name = name
        self.barista = barista
        self.totalMoney = totalMoney
        self.menu = menu
    }
    
    func order(menuName: Coffee, customerMoney: Int) -> Int {
        print("어떤 메뉴 주문하시겠어요?")
        var coffeePrice: Int = 0
        print("\(menuName.rawValue) 주세요.")
        if let price = self.menu[menuName] {
            coffeePrice = price
            if customerMoney >= coffeePrice {
                makeCoffee(menuName: menuName)
                self.totalMoney = self.totalMoney + coffeePrice
            } else {
                print("잔액이 부족합니다.")
            }
        } else {
            print("저희 카페에는 없는 메뉴입니다.")
        }
        
        return coffeePrice
    }
    
    func makeCoffee(menuName: Coffee) {
        self.pickUpTable.append(menuName)
        print("커피가 완성되었습니다.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case iceTea = "아이스티"
    case lemonAde = "레몬에이드"
}

var misterLee: Person = Person(name: "misterLee", money: 500000)
var missKim: Person = Person(name: "missKim", money: 30000)

var yagombucks: CoffeeShop = CoffeeShop(name: "yagombucks", barista: misterLee, totalMoney: 10000000, menu: [.americano: 2000, .latte: 2900, .iceTea: 3000, .lemonAde: 3500])
missKim.buyCoffee(coffeeshopName: yagombucks, menuName: .americano)
