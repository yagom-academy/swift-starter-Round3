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
    var menu: (KindOfCoffee: String, price: Int)
    var pickUpTable: Array<String> = Array<String>()
    
    init(sales: Int, menu: (String,Int), pcikUpTable: Array<String>){
        self.menu = menu
        self.sales = sales
        self.pickUpTable = pcikUpTable
    }
    
    func orderMenu(coffee: Coffee) {
        print("\(coffee)한잔 주문 받았습니다.")
    }
    
    func makeCoffe(coffee: Coffee) {
        print("\(coffee)를 만들었습니다.")
    }
}

enum Coffee {
    case americano
    case cafeLatte
    case coldBrew
}

var misterLee: Person = Person(money: 10000)
var missKim: Person = Person(money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, menu: ("",0),  pcikUpTable: [])
var yagombucksBarista = misterLee
