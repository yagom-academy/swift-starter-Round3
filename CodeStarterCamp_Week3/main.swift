//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//Person 타입의 인스턴스로 misterLee , missKim 을 생성
let missKim = Person(name: "missKim", age: 35, walletInCash: 10000)
let misterLee = Person(name: "misterLee", age: 31, habit: "농구", MBTI: "INFJ", walletInCash: 20000)

//CoffeeShop 타입의 인스턴스로 yagombucks 을 생성
var yagombucks = CoffeeShop(owner: "야곰", openingHours: "10:00 ~ 20:00", menu: Coffee.menu, barista: misterLee)

missKim.buyCoffee(Coffee.caramelMacchiato, at: yagombucks)
missKim.walletInCash = 4000
missKim.buyCoffee(Coffee.caramelMacchiato, at: yagombucks)
