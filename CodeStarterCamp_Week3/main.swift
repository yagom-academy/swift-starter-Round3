//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//Person 타입의 인스턴스로 misterLee , missKim 을 생성
let missKim = Person(name: "missKim", age: 35, getMoney: 10000)
let misterLee = Person(name: "misterLee", age: 31, habit: "농구", mbti: "INFJ", getMoney: 20000)

//CoffeeShop 타입의 인스턴스로 yagombucks 을 생성
let yagombucks = CoffeeShop(owner: "야곰", openingHours: "10:00 ~ 20:00")
//yagombucks의 바리스타를 misterLee로 할당
yagombucks.barista = misterLee
//yagombucks의 메뉴를 coffeeMenu로 할당
yagombucks.menu = coffeeMenu

