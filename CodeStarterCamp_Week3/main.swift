//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "이철수", age: 30, gender: Person.Gender.male, money: 100000)
var missKim: Person = Person(name: "김영희", age: 18, gender: Person.Gender.female, money: 30000)
var yagombucks: CoffeeShop = CoffeeShop(brandName: "yagombucks", branchName: "코엑스별마당점")

yagombucks.hireNewBarista(newBarista: misterLee)
yagombucks.takeOrder()
yagombucks.makeCoffee(orderedMenu: Coffee.frappuccino)
