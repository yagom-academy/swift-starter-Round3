//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/**
 Step 1: 타입과 인스턴스의 관계
 */

//var misterLee = Person(totalMoney: 10000)
//var missKim = Person(totalMoney: 100)
//var missPark = Person(totalMoney: 10000)
//
//var yagombucks = CoffeeShop(menus: [CoffeeShop.Menu(coffee: .Americano, price: 400),
//                                    CoffeeShop.Menu(coffee: .CaffeeLatte, price: 500)])
//
//yagombucks.takeOrder(person: missKim, coffees: .CaffeeMocha)
//
//yagombucks.barista = misterLee
//
//yagombucks.takeOrder(person: missKim)
//
//yagombucks.takeOrder(person: missKim, coffees: .Americano)
//
//missKim.totalMoney = 10000
//
//yagombucks.takeOrder(person: missKim, coffees: .CaffeeMocha, .Americano)
//
//yagombucks.takeOrder(person: missKim, coffees: .Americano, .CaffeeLatte)
//
//yagombucks.barista = missPark
//
//yagombucks.takeOrder(person: missKim, coffees: .Americano, .Americano, .Americano)
//
//print("영업 종료 : 총 매출액 \(yagombucks.salesRevenue)원")

/**
 Step 2: 인스턴스는 서로 소통한다.
 */

var missKim = Person(totalMoney: 10000)
var missPark = Person(totalMoney: 10000)
var misterMin = Person(totalMoney: 10000)

var yagombucks = CoffeeShop(menus: [CoffeeShop.Menu(coffee: .Americano, price: 4000),
                                    CoffeeShop.Menu(coffee: .CaffeeLatte, price: 5000)])

missKim.order(.Americano, .CaffeeLatte, of: yagombucks, by: "김김")

yagombucks.barista = missPark

missKim.order(.Americano, .CaffeeLatte, of: yagombucks, by: "김김")
misterMin.order(.Americano, of: yagombucks, by: "민부장")
misterMin.order(.Americano, .CaffeeLatte, of: yagombucks, by: "민부장")

print("영업 종료 : 총 매출액 \(yagombucks.salesRevenue)원")
