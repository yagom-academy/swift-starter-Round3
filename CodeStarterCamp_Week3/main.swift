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
    
    init(money: Int) {
        self.money = money
    }
    
    func buySomething(price: Int) {
        print(money-price)
    }
}

class CoffeeShop {
    var sales: Int
    var kindOfCoffeeMenu: String
    var priceOfCoffeeMenu: Int
    var pickUpTable: Array<String> = Array<String>()
    var barista: Person
    
    init(sales: Int, kindOfCoffeeMenu: String, priceOfCoffeeMenu: Int, pcikUpTable: Array<String>, barista: Person) {
        self.kindOfCoffeeMenu = kindOfCoffeeMenu
        self.priceOfCoffeeMenu = priceOfCoffeeMenu
        self.sales = sales
        self.pickUpTable = pcikUpTable
        self.barista = barista
    }
    
    enum Coffee {
        case americano
        case cafeLatte
        case coldBrew
    }
    
    func orderMenu(coffee: Coffee) {
        print("\(coffee)한잔 주문 받았습니다.")
    }
    
    func makeCoffe(coffee: Coffee) {
        print("\(coffee)를 만들었습니다.")
    }
}

var misterLee: Person = Person(money: 10000)
var missKim: Person = Person(money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, kindOfCoffeeMenu: "", priceOfCoffeeMenu: 0, pcikUpTable: [], barista: misterLee)

