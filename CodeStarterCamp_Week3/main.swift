//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "misterLee", asset: 10000 )
var missKim: Person = Person(name: "missKim", asset: 0 )
var yagombucks: CoffeeShop = CoffeeShop(menu: [Coffee.americano: 4000, Coffee.latte: 4500])

yagombucks.barista = misterLee
misterLee.buyCoffee(menu: [Coffee.americano, Coffee.latte], at: yagombucks)

dump(missKim)
dump(misterLee)
dump(yagombucks.pickUpTable)




