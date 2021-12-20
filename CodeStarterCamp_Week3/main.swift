//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterMino: Person = Person(age: 26, name: "마이노", money: 10000)
var missMinjin: Person = Person(age: 30, name: "민지니", money: 30000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0,
                                        menu: [Coffee.americano : Coffee.americano.price,
                                               Coffee.vanillaLatte : Coffee.vanillaLatte.price,
                                               Coffee.coldBrew : Coffee.coldBrew.price],
                                        pickUpTable: [])

yagombucks.barista = misterMino
