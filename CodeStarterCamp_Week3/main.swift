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
    var moneyInWallet: Int?
    var age: Int {
        get {
            return 2023 - birthYear
        }
    }
    
    init(nationality: String, birthYear: Int, birthDate: Int) {
        self.nationality = nationality
        self.birthYear = birthYear
        self.birthDate = birthDate
    }
    
    init(nationality: String, birthYear: Int, birthDate: Int, moneyInWallet: Int) {
        self.init(nationality: nationality, birthYear: birthYear, birthDate: birthDate)
        self.moneyInWallet = moneyInWallet
    }
    
    mutating func orderCoffee(coffeePrice: Int) {
        if let money = self.moneyInWallet {
            if money >= coffeePrice {
                self.moneyInWallet = money - coffeePrice
            } else {
                print("가지고 있는 금액으로는 구매할 수 없습니다.")
            }
        }
    }
}

class CoffeShop {
    var cafeName: String
    var menu: Dictionary<Coffee, Int>
    var sales: Int
    var barista: String?
    var pickUpTable: Array<Coffee>
    
    init(cafeName: String, menu: Dictionary<Coffee, Int>, sales: Int, pickUpTable: Array<Coffee>) {
        self.cafeName = cafeName
        self.menu = menu
        self.sales = sales
        self.pickUpTable = pickUpTable
    }
    
    convenience init(cafeName: String, barista: String, menu: Dictionary<Coffee, Int>, pickUpTable: Array<Coffee>, sales: Int) {
        self.init(cafeName: cafeName, menu: menu, sales: sales, pickUpTable: pickUpTable)
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
    
    func takeOrder(_ coffees: Coffee...) {
        for kindOfCoffee in coffees {
            if let coffee = menu[kindOfCoffee] {
                self.sales += coffee
                makeCoffee(kindOfCoffee)
            } else {
                print("\(kindOfCoffee)는 메뉴에 없습니다.")
            }
        }
    }
    
    func makeCoffee(_ coffees: Coffee) {
        self.pickUpTable.append(coffees)
        print("주문하신 \(coffees) 나왔습니다.")
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

var misterLee = Person(nationality: "Korea", birthYear: 1990, birthDate: 0509, moneyInWallet: 3000)
var missKim = Person(nationality: "Korea", birthYear: 1997, birthDate: 1111, moneyInWallet: 10000)
var yagombucks = CoffeShop(cafeName: "yagombucks", menu: [Coffee.americano : 2000, Coffee.honeyAmericano : 3000, Coffee.cappuccino: 4000, Coffee.cafeLatte: 4000], sales: 0, pickUpTable: [])

yagombucks.barista = "misterLee"
