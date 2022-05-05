//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "Lee JongSuk", money: 10000)
let missKim = Person(name: "Kim Yuna", money: 20000)
let yagombucks = CoffeeShop(revenue: 0, menu: [.espresso : 1000, .americano: 2000, .vanillaLatte: 3000, .cafeMocha: 3500])

yagombucks.barista.append(misterLee)
missKim.buy(coffee: .espresso, shop: yagombucks)
missKim.buy(coffee: .americano, shop: yagombucks)
