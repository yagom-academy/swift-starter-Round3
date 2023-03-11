//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misskim = Person(haveMoney: 6500, name: "misskim")
var idinaloq = Person(haveMoney: 2000, name: "idinaloq")
var yagombucks = CoffeeShop(revenue: 0, menu: [.espresso: 3000, .americano: 3500, .cappuccino: 4500, .cafeLatte: 5500])

misskim.order(.cafeLatte, of: yagombucks, by: misskim.name)
idinaloq.order(.americano, of: yagombucks, by: idinaloq.name)
