//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//바리스타
var misterlee: Person = Person(money: 0, nickname: "misterLee")
//야곰벅스
var yagombucks: CoffeeShop = CoffeeShop(barista: misterlee, sales: 0, pickUpTable: [], menu: [Coffee.americano: 2500, Coffee.decaffeine: 2500, Coffee.vanilla: 3500, Coffee.caramel: 3500, Coffee.cappuccino: 3500] )
//손님 주문
var missKim: Person = Person(money: 10000, nickname: "missKim")
missKim.buyCofffee(menu: Coffee.americano.rawValue, price: yagombucks.menu[Coffee.americano] ?? 0)
missKim.buyCofffee(menu: Coffee.latte.rawValue, price: yagombucks.menu[Coffee.latte] ?? 0)

var mommy: Person = Person(money: 6000, nickname: "Mommy")
mommy.buyCofffee(menu: Coffee.americano.rawValue, price: yagombucks.menu[Coffee.americano] ?? 0)

//야곰벅스 손님 호출
yagombucks.processOrder(nickname: missKim.nickname, menu: Coffee.americano.rawValue, totalPrice: yagombucks.menu[Coffee.americano] ?? 0)
yagombucks.processOrder(nickname: missKim.nickname, menu: Coffee.latte.rawValue, totalPrice: yagombucks.menu[Coffee.latte] ?? 0)
yagombucks.processOrder(nickname: mommy.nickname, menu: Coffee.americano.rawValue, totalPrice: yagombucks.menu[Coffee.americano] ?? 0)

//야곰벅스 현재 매출액 확인
yagombucks.checkSales()
