//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let yagombucksMenu: [Coffee: Int] = [.americano : Coffee.americano.price,
                                     .vanillaLatte : Coffee.vanillaLatte.price,
                                     .coldBrew : Coffee.coldBrew.price]

var misterMino: Person = Person(age: 26, name: "마이노", money: 10000)
var missMinjin: Person = Person(age: 30, name: "민지니", money: 6000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0,
                                        menu: yagombucksMenu)

yagombucks.customer = missMinjin
yagombucks.barista = misterMino

print("계산하기 전 -손님- 보유 금액: \(missMinjin.money)")
print("계산하기 전 /매장/ 보유 금액: \(yagombucks.sales)\n")
yagombucks.order(coffee: Coffee.vanillaLatte)
print("계산 후 -손님- 보유 금액: \(missMinjin.money)")
print("계산 후 /매장/ 보유 금액: \(yagombucks.sales)\n")

yagombucks.order(coffee: Coffee.vanillaLatte)
print("잔액이 부족할 때 -손님- 보유 금액: \(missMinjin.money)")
print("잔액이 부족할 때 /매장/ 보유 금액: \(yagombucks.sales)\n")

yagombucks.customer = misterMino
print("계산하기 전 -손님- 보유 금액: \(misterMino.money)")
print("계산하기 전 /매장/ 보유 금액: \(yagombucks.sales)\n")
yagombucks.order(coffee: Coffee.vanillaLatte)
print("계산 후 -손님- 보유 금액: \(misterMino.money)")
print("계산 후 /매장/ 보유 금액: \(yagombucks.sales)\n")

yagombucks.order(coffee: Coffee.vanillaLatte)
print("잔액이 부족할 때 -손님- 보유 금액: \(misterMino.money)")
print("잔액이 부족할 때 /매장/ 보유 금액: \(yagombucks.sales)")
