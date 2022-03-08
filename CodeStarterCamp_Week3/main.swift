//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

//MARK: - Step1

var misterLee = Person(money: 3000, name: "misterLee")
var missKim = Person(money: 2000, name: "missKim")

var yagombucks = CoffeeShop(menu: [.americano: 2000, .latte: 3000, .cappuccino: 4000])
yagombucks.barista = misterLee
