//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", age: 20, gender: "M", money: 10000)
var missKim = Person(name: "missKim", age: 28, gender: "F", money: 9000)

var yagombucks = CoffeeShop(barista: misterLee)

// TODO: missKim 은 yagombucks 의 order(coffee: Coffee) 메서드를 호출해 커피를 주문합니다.
// TODO: 주문과 동시에 missKim의 돈은 커피의 가격만큼 줄어들고, yagombucks 의 매출액은 커피 가격만큼 증가합니다.

// 주문할 음료: 핫초코
let hotChoco = Coffee.hotChocolate
missKim.purchase(shop: yagombucks, stuff: hotChoco)
