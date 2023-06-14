//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

var missKim: Person = Person(money: 10000, name: "김여사님")
var missLee: Person = Person(money: 10000, name: "이여사님")
var baristaBear: Person = Person(money: 100, name: "곰바리스타")
var yagombucks: CoffeeShop = CoffeeShop(sales: 100000, barista: baristaBear)
missKim.orderCoffee(.americano, of: yagombucks, by: missKim.name)
missLee.orderCoffee(.latte, of: yagombucks, by: missLee.name)
