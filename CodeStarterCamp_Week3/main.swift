//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 10000, name: "misterLee")
var missKim: Person = Person(money: 2000, name: "missKim")

var yagomBucks: CoffeeShop = CoffeeShop(amerianoPrice: 2000, cafeLattePrice: 2500, vanilaLattePrice: 3000, cafeMocaPrice: 3500, chocoLattePrice: 4000, name: "yagomBucks")

yagomBucks.barista = misterLee
yagomBucks.takeOrder(coffee: .americano, customer: missKim)
yagomBucks.takeOrder(coffee: .chocoLatte, customer: missKim)
yagomBucks.takeOrder(coffee: .greenTeaLatte, customer: missKim)


