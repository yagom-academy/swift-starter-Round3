//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    
    init(money: Int = 0) {
        self.money = money
    }
    
    func hasEnoughMoney(for productPrice: Int) -> Bool {
        if productPrice > self.money {
            print("잔액이 \(productPrice - self.money)원만큼 부족합니다.")
            return false
        } else {
            return true
        }
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let coffeePrice = coffeeShop.checkPrice(coffee) {
            if self.hasEnoughMoney(for: coffeePrice) {
                self.money -= coffeePrice
                coffeeShop.processPurchase(for: coffee, with: coffeePrice, from: name)
            }
        }
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case latte = "라떼"
    case decaffeinatedAmericano = "디카페인 아메리카노"
    case cappuccino = "카푸치노"
}

class CoffeeShop {
    var menu: Dictionary<Coffee, Int>
    var barista: Person
    var pickUpTable: Array<Coffee> = Array<Coffee>()
    var revenue: Int = 0
    
    init(menu: Dictionary<Coffee, Int>, barista: Person) {
        self.barista = barista
        self.menu = menu
    }
    
    func checkPrice(_ coffee: Coffee) -> Int? {
        if let coffeePrice = self.menu[coffee] {
            return coffeePrice
        } else {
            print("주문하신 메뉴가 존재하지 않습니다.")
            return nil
        }
    }
    
    func make(_ coffee: Coffee, for name: String) {
        self.pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    func processPurchase(for coffee: Coffee, with price: Int, from name: String) {
        self.revenue += price
        self.make(coffee, for: name)
    }
}

var misterLee = Person()
var missKim = Person(money: 10000)
var zzanggoo = Person(money: 5000)
var minhyunm = Person(money: 2000)
var yagombucks = CoffeeShop(menu: [Coffee.espresso: 3000,
                                   Coffee.americano: 3500,
                                   Coffee.latte: 4000,
                                   Coffee.cappuccino: 4500],
                            barista: misterLee)

missKim.order(Coffee.cappuccino, of: yagombucks, by: "missKim")
zzanggoo.order(Coffee.americano, of: yagombucks, by: "커피를못마시는짱구")
minhyunm.order(Coffee.americano, of: yagombucks, by: "minhyunm")


