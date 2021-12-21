//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let yagombucksMenu: [Coffee: Int] = [.americano : Coffee.americano.price,
                                     .vanillaLatte : Coffee.vanillaLatte.price,
                                     .coldBrew : Coffee.coldBrew.price]

var misterMino: Person = Person(age: 26, name: "마이노", money: 10000)
var missMinjin: Person = Person(age: 30, name: "민지니", money: 30000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0,
                                        menu: yagombucksMenu,
                                        pickUpTable: [])

yagombucks.barista = misterMino
