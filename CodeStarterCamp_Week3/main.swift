//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


func order(_ coffee: Coffee, of coffeeShop: inout CoffeeShop, by name: String, money: Int) {
    var customer = Person(name: name, money: money)
    coffeeShop.orderCoffee(from: &customer, menu: coffee, barista: coffeeShop.barista)
}


var missKim = Person(name: "missKim", money: 3000)
var yagombucks = CoffeeShop(sales: 0, menu: ["아메리카노": 5000,
                                             "카페라떼": 5500,
                                             "에스프레소": 4500],
                            pickUpTable: [], barista: "")


order(.americano, of: &yagombucks, by: missKim.name, money: missKim.money)

