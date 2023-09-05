//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let orderedCoffee: String = "americano"
let menu: [String: Int] = ["caffelatte": 5000, "americano": 4500, "caffemocha": 5500, "coldbrew": 4500, "espresso": 4000]
var pickupTable = [String]()

struct Person {
    var money: UInt = 50000
}

func purchaseCoffee(coffee: String, coffeeCost: Int) {
    print("\(coffeeCost)₩을 사용해서 \(coffee)를 구매합니다.")
}

class CoffeeShop {
    var barista: Person
    var sales: Int
    var menus: [String: Int]
    var pickupTable: [String]
    init(barista: Person, sales: Int, menus: [String: Int], pickupTable: [String]) {
        self.barista = barista
        self.sales = 0
        self.menus = menus
        self.pickupTable = pickupTable
    }

    func orderCoffee(coffeeName: String) {
        if let coffeeCost: Int = menus[coffeeName] {
            print("\(coffeeCost)원 짜리 \(coffeeName)를 주문 받습니다.")
        }
    }

    func serviceCoffee(coffeeName: String) {
        print("\(coffeeName)를 만들어 Pick-Up Table에 두었습니다.")
        self.pickupTable.append(coffeeName)
        print("현재 Pick-Up Table에는 \(self.pickupTable)이 있습니다.")
    }
}

enum Coffee {
    case caffeLatte
    case americano
    case caffemocha
    case coldbrew
    case espresso
}

var missKim = Person(money: 50000)
var misterLee = Person(money: 50000)
var yagombucks = CoffeeShop.init(barista: misterLee, sales: 0, menus: menu, pickupTable: pickupTable)
