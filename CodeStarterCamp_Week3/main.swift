//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "misterLee", age: 22, money: 5000, nationality: "Korea", gender: Person.Gender.man)
var missKim: Person = Person(name: "missKim", age: 35, money: 6000, nationality: "Korea", gender: Person.Gender.woman)

var yagombucks = CoffeeShop(barista: misterLee)

missKim.order(from: yagombucks, Coffee.coldBrew)
missKim.order(from: yagombucks, .latte)
