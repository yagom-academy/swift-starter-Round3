//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim = Person(name: "missKim", money: 6000)
var yagombucks = CoffeeShop(menu: [Coffee.americano: Coffee.americano.price,
                                             Coffee.caffeLatte: Coffee.caffeLatte.price,
                                   Coffee.espresso: Coffee.espresso.price], barista: "")



missKim.order(.americano, of: &yagombucks)
