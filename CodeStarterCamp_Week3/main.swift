//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "misterLee", age: 32)
var missKim: Person = Person(name: "missKim", age: 25)

var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee
yagombucks.getOrder(menus: [Coffee.americano])

dump(missKim)
dump(misterLee)
dump(yagombucks)




