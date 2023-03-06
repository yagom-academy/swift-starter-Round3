//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//바리스타
var misterlee: Person = Person(money: 0, price: Menu.Coffee.americano.CoffeePrice(beans: yagombucks.beansPrice, lattes: yagombucks.lattesPrice), menu: Menu.Coffee.americano.rawValue)
//야곰벅스
var yagombucks: CoffeeShop = CoffeeShop(barista: misterlee, sales: 0, pickUpTable: [], lattesPrice: 1500, beansPrice: 1000)
//손님 주문
var missKim: Person = Person(money: 10000, price: Menu.Coffee.latte.CoffeePrice(beans: yagombucks.beansPrice, lattes: yagombucks.lattesPrice), menu: Menu.Coffee.latte.rawValue)

//야곰벅스 손님 호출
yagombucks.processOrder(number: 1, menu: Menu.Coffee.americano.rawValue, totalPrice: Menu.Coffee.americano.CoffeePrice(beans: yagombucks.beansPrice, lattes: yagombucks.lattesPrice))
yagombucks.processOrder(number: 2, menu: Menu.Coffee.latte.rawValue, totalPrice: Menu.Coffee.latte.CoffeePrice(beans: yagombucks.beansPrice, lattes: yagombucks.lattesPrice))

//야곰벅스 현재 매출액 확인
yagombucks.checkSales()
