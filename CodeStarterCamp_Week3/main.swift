//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var nationality: String
    var birthYear: Int
    var birthDate: Int
    var money: Int
    var age: Int {
        get {
            return 2023 - birthYear
        }
    }
    
    init(name: String, nationality: String, birthYear: Int, birthDate: Int, money: Int) {
        self.name = name
        self.nationality = nationality
        self.birthYear = birthYear
        self.birthDate = birthDate
        self.money = money
    }
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        print("\(name)님이 \(coffee.rawValue)를 주문합니다.")
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                self.money = money - price
                coffeeShop.takeOrder(coffee)
                print("\(name)님의 금액이 \(price)원 만큼 차감됩니다.\n남은 금액은 \(self.money)원입니다.")
                coffeeShop.make(coffee, for: name)
            } else {
                print("잔액이 \(price - self.money)원만큼 부족합니다.")
            }
        } else {
            coffeeShop.takeOrder(coffee)
        }
    }
}

class CoffeeShop {
    var name: String
    var menu: Dictionary<Coffee, Int>
    var sales: Int
    var barista: String?
    var orderer: String?
    var pickUpTable: Array<Coffee> = [] {
        willSet(orderCoffee) {
            if let orderername = self.orderer {
                if let coffee = orderCoffee.last {
                    print("\(orderername)님의 \(coffee.rawValue)가 준비 중입니다. 잠시만 기다려주세요.")
                }
            }
        }
        didSet {
            if let orderername = self.orderer {
                if let coffee = pickUpTable.last {
                    print("\(orderername)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
    }
    
    init(name: String, menu: Dictionary<Coffee, Int>, sales: Int) {
        self.name = name
        self.menu = menu
        self.sales = sales
    }
    
    convenience init(name: String, barista: String, menu: Dictionary<Coffee, Int>, sales: Int) {
        self.init(name: name, menu: menu, sales: sales)
        self.barista = barista
    }
    
    func takeOrder(_ coffee: Coffee) {
        if let price = menu[coffee] {
            self.sales += price
        } else {
            print("손님 \(coffee.rawValue)는 메뉴에 없습니다.")
        }
    }
    
    func make(_ coffee: Coffee, for name: String) {
        self.orderer = name
        self.pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case honeyAmericano = "꿀아메리카노"
    case cappuccino = "카푸치노"
    case cafeLatte = "카페라떼"
    case caramelMacchiato = "카라멜 마끼야또"
    case vanillaLatte = "바닐라라떼"
}
    

var missKim = Person(name: "missKim", nationality: "Korea", birthYear: 1997, birthDate: 1111, money: 10000)
var 커피를못마시는짱구 = Person(name: "커피를못마시는짱구", nationality: "Japan", birthYear: 1998, birthDate: 1212, money: 10000)
let yagombucks = CoffeeShop(name: "yagombucks", menu: [Coffee.americano : 2000, Coffee.honeyAmericano : 3000, Coffee.cappuccino: 4000, Coffee.cafeLatte: 4000], sales: 0)

yagombucks.barista = "misterLee"

missKim.order(Coffee.americano, of: yagombucks, by: missKim.name)
커피를못마시는짱구.order(Coffee.honeyAmericano, of: yagombucks, by: 커피를못마시는짱구.name)
missKim.order(Coffee.caramelMacchiato, of: yagombucks, by: missKim.name)
