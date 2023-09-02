//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

var orderedCoffee: String = "americano"
var menu: [String: Int] = ["caffelatte": 5000, "americano": 4500, "caffemocha": 5500, "coldbrew": 4500, "espresso": 4000]
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
    init(barista: Person, sales: Int, menus: [String : Int], pickupTable: [String]) {
        self.barista = barista
        self.sales = 0
        self.menus = menus
        self.pickupTable = pickupTable
    }
}

func orderCoffee(shop: CoffeeShop) {
    let coffeeCost = shop.menus[orderedCoffee]!
    print("\(coffeeCost)₩ 가격의 \(orderedCoffee)를 주문받습니다.")
    makeCoffee(shop: shop)
}
func makeCoffee(shop: CoffeeShop) {
    print("\(orderedCoffee)를 만들어 PickUp Table에 두었습니다.")
    shop.pickupTable.append(orderedCoffee)
    print("Pick-Up Table에 \(shop.pickupTable)가 있습니다.")
}

enum coffee: String {
    case caffeLatte
    case americano
    case caffemocha
    case coldbrew
    case espresso
}

var missKim = Person(money: 50000)
var misterLee = Person(money: 50000)
var yagombucks = CoffeeShop(barista: misterLee, sales: 0, menus: menu, pickupTable: pickupTable)

print(orderCoffee(shop: yagombucks))
