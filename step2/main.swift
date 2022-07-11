//
//  main.swift
//  step2
//
//  Created by codenest on 2022/07/06.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    func order(_ coffee: Coffee, _ coffeeshop: CoffeeShop) {
        if let price = coffeeshop.menu[coffee] {
            if money >= price {
                coffeeshop.make(coffee, from: self.name)
                coffeeshop.grossSales += price
                money -= price
            } else {
                print("잔액이 \(abs(money-price))원만큼 부족합니다.")
            }
        } else {
            print("선택하신 커피는 메뉴에 없습니다.")
        }
    }
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
}

class CoffeeShop {
    var shopName: String
    var grossSales: Int
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    init(shopName: String, grossSales: Int, barista: Person, menu: [Coffee: Int], pickUpTable: [Coffee]) {
        self.shopName = shopName
        self.grossSales = grossSales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    func make(_ coffee: Coffee, from name: String) {
        if menu[coffee] != nil {
            pickUpTable.append(coffee)
            print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case caffeeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case decaf = "디카페인"
    case einspanner = "아인슈패너"
    case caramelMacchiato = "카라멜 마끼아또"
}

let misterLee: Person = Person(name: "Minsu Lee", age: 26, money: 10000)
let missKim: Person = Person(name: "Jisu Kim", age: 23, money: 10000)
let yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks",
                                        grossSales: 0,
                                        barista: misterLee,
                                        menu: [Coffee.americano : 3500,
                                               Coffee.caffeeLatte : 4500,
                                               Coffee.cappuccino : 4000,
                                               Coffee.decaf : 4000,
                                               Coffee.einspanner : 5000,
                                               Coffee.caramelMacchiato : 5000],
                                        pickUpTable: [])

missKim.order(Coffee.einspanner, yagombucks)
