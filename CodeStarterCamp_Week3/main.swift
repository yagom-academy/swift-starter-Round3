//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var nationality: String
    var birthYear: Int
    var birthDate: Int
    var money: Int
    var age: Int {
        get {
            return 2023 - birthYear
        }
    }
    
    init(nationality: String, birthYear: Int, birthDate: Int, money: Int) {
        self.nationality = nationality
        self.birthYear = birthYear
        self.birthDate = birthDate
        self.money = money
    }
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        print("\(coffee)를 주문합니다.")
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                self.money = money - price
                print("금액이 \(price)만큼 차감됩니다.\n\(name)님의 남은 금액은 \(self.money)입니다.")
                coffeeShop.make(coffee, for: name)
            } else {
                print("잔액이 \(price - self.money)원만큼 부족합니다.")
            }
        }
    }
}

class CoffeeShop {
    var name: String
    var menu: Dictionary<Coffee, Int>
    var sales: Int
    var barista: String?
    var pickUpTable: Array<Coffee>
    
    init(name: String, menu: Dictionary<Coffee, Int>, sales: Int, pickUpTable: Array<Coffee>) {
        self.name = name
        self.menu = menu
        self.sales = sales
        self.pickUpTable = pickUpTable
    }
    
    convenience init(name: String, barista: String, menu: Dictionary<Coffee, Int>, pickUpTable: Array<Coffee>, sales: Int) {
        self.init(name: name, menu: menu, sales: sales, pickUpTable: pickUpTable)
        self.barista = barista
    }
    
    func takeOrder(_ coffee: Coffee) {
        if let price = menu[coffee] {
            self.sales += price
        } else {
            print("손님 \(coffee)는 메뉴에 없습니다.")
        }
    }
    
    func make(_ coffee: Coffee, for name: String) {
        takeOrder(coffee)
        self.pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "americano"
    case honeyAmericano = "honeyAmericano"
    case cappuccino = "cappuccino"
    case cafeLatte = "cafeLatte"
    case caramelMacchiato = "caramelMacchiato"
    case vanillaLatte = "vanillaLatte"
}

var missKim = Person(nationality: "Korea", birthYear: 1997, birthDate: 1111, money: 2000)
var 커피를못마시는짱구 = Person(nationality: "Japan", birthYear: 1998, birthDate: 1212, money: 10000)
var yagombucks = CoffeeShop(name: "yagombucks", menu: [Coffee.americano : 2000, Coffee.honeyAmericano : 3000, Coffee.cappuccino: 4000, Coffee.cafeLatte: 4000], sales: 0, pickUpTable: [])

yagombucks.barista = "misterLee"

missKim.order(Coffee.americano, of: yagombucks, by: "missKim")
커피를못마시는짱구.order(Coffee.honeyAmericano, of: yagombucks, by: "커피를못하시는짱구")
