//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 4. Person 타입의 인스턴스로 misterLee , missKim 을 생성해봅시다.
var misterLee = Person(name: "MadCow", gender: Person.Gender.man, MBTI: "ISTP", age: 28)
var missKim = Person(name: "Kim", gender: Person.Gender.woman, MBTI: "ENFJ", age: 28)

// 5. CoffeeShop 타입의 인스턴스로 yagombucks 을 생성해봅시다.
// 6. yagombucks 의 바리스타(barista)를 misterLee 로 할당해봅시다.
let coffeeMenus = Coffee.getCoffeeMenus()
let yagombucks = CoffeeShop(name: "야곰 커피샵", totalSales: 0, coffeeMenu: coffeeMenus, pickUpTable: [], barista: misterLee)

let orderCoffeeList: [Coffee] = [
    Coffee.espresso,
    Coffee.ade,
    Coffee.americano,
    Coffee.latte,
    Coffee.americano,
    Coffee.latte,
    Coffee.latte,
    Coffee.ade,
    Coffee.americano
]

missKim.coffeeOrder(menu: orderCoffeeList, coffeeShop: yagombucks)
