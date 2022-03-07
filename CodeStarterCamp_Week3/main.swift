//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


var misterLee = Person(name: "misterLee", age: 25, money: 10000)
var missKim = Person(name: "missKim", age: 27, money: 20000)
var yagomBucks = CoffeeShop(totalRevenue: 0, menu: [Coffee.americano: 5000, Coffee.latte: 5500, Coffee.cappuccino: 5500], pickUpTable: "주문하신 \(Coffee.Type.self) 나왔습니다.", barista: misterLee)
