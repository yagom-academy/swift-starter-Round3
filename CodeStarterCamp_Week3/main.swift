//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", money: 3000)
var missKim = Person(name: "missKim", money: 50000)

var yagombucks = CoffeeShop(sales: 0, menu: ["아메리카노": 5000,
                                             "카페라떼": 5500,
                                             "에스프레소": 4500],
                            pickUpTable: [], barista: "")

yagombucks.orderCoffeeFromCustomer(for: &missKim, menu: .espresso, barista: "misterLee")


