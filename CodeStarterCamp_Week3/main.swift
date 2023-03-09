//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misskim = Person(haveMoney: 5000, nickName: "misskim")
var idinaloq = Person(haveMoney: 6000, nickName: "idinaloq")
var yagombucks = CoffeeShop(revenue: 0, menu: [.espresso: 3000, .americano: 3500, .cappuccino: 4500, .cafeLatte: 5500])

misskim.order(.espresso, of: yagombucks, by: "misskim")
idinaloq.order(.americano, of: yagombucks, by: "idinaloq")
