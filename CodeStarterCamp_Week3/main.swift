//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let missKim = Person(name: "미스 킴", money: 3000, gender: .female)
let yagomBucks = CoffeeShop(name: "야곰벅스", totalProfit: 0, menu: [:], pickupTable: [])

missKim.order(.americano, of: yagomBucks, by: "미스 킴")
