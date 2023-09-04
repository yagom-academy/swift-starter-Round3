//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/*
print("\nRound 3 STEP 1")

var misterLee = Person(name: "이현", age: 30, gender: .male, mbti: .ENFP, money: 30000)
let missKim = Person(name: "김하니", age: 24, gender: .female, mbti: .ISTJ, money: 170000)
let yagombucks = CoffeeShop(name: "야곰벅스")
yagombucks.setBarista(misterLee)
yagombucks.setMenu([
    CoffeeShop.MenuItem(coffee: Coffee(name: .espresso, size: .short), price: 4000),

    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .tall), price: 5000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .grande), price: 6000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .venti), price: 7000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .tall, isHot: false), price: 6500),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .grande, isHot: false), price: 7500),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .venti, isHot: false), price: 8500),

    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .grande), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .venti), price: 10000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .grande, isHot: false), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .venti, isHot: false), price: 10000),

    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .grande), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .venti), price: 10000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .grande, isHot: false), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .venti, isHot: false), price: 10000),

    CoffeeShop.MenuItem(coffee: Coffee(name: .irish, size: .tall), price: 12000),
])

print(misterLee.buyCoffee(Coffee(name: .americano, size: .tall, isHot: false), atShop: yagombucks))
print(misterLee.buyCoffee(Coffee(name: .espresso, size: .short), atShop: yagombucks))
print(misterLee.buyCoffee(Coffee(name: .espresso, size: .tall), atShop: yagombucks))
print(misterLee.buyCoffee(Coffee(name: .irish, size: .tall), atShop: yagombucks))
print(misterLee.buyCoffee(Coffee(name: .mocha, size: .grande, isHot: false), atShop: yagombucks))
print("\(misterLee.name) 의 현재 잔액은 \(misterLee.money) 입니다.")
print("\(yagombucks.name) 의 매출은 \(yagombucks.salesAmount) 입니다.")
//print(yagombucks.pickUpTable)
*/

print("\nRound 3 STEP 2")

var misterLee = Person(name: "이현", age: 30, gender: .male, mbti: .ENFP, money: 30000)
let missKim = Person(name: "김하니", age: 24, gender: .female, mbti: .ISTJ, money: 20000)
let yagombucks = CoffeeShop(name: "야곰벅스")
yagombucks.setBarista(misterLee)
yagombucks.setMenu([
    CoffeeShop.MenuItem(coffee: Coffee(name: .espresso, size: .short), price: 4000),

    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .tall), price: 5000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .grande), price: 6000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .venti), price: 7000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .tall, isHot: false), price: 6500),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .grande, isHot: false), price: 7500),
    CoffeeShop.MenuItem(coffee: Coffee(name: .americano, size: .venti, isHot: false), price: 8500),

    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .grande), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .venti), price: 10000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .grande, isHot: false), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .caffeLatte, size: .venti, isHot: false), price: 10000),

    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .grande), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .venti), price: 10000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .grande, isHot: false), price: 9000),
    CoffeeShop.MenuItem(coffee: Coffee(name: .mocha, size: .venti, isHot: false), price: 10000),

    CoffeeShop.MenuItem(coffee: Coffee(name: .irish, size: .tall), price: 12000),
])

print(missKim.order(Coffee(name: .americano, size: .tall, isHot: false), of: yagombucks, by: missKim.name))
print(missKim.order(Coffee(name: .espresso, size: .short), of: yagombucks, by: missKim.name))
print(missKim.order(Coffee(name: .espresso, size: .tall), of: yagombucks, by: missKim.name))
print(missKim.order(Coffee(name: .irish, size: .tall), of: yagombucks, by: missKim.name))
print(misterLee.order(Coffee(name: .mocha, size: .grande, isHot: false), of: yagombucks, by: misterLee.name))
//print("\(misterLee.name) 의 현재 잔액은 \(misterLee.money) 입니다.")
//[print("\(missKim.name) 의 현재 잔액은 \(missKim.money) 입니다.")
//print("\(yagombucks.name) 의 매출은 \(yagombucks.salesAmount) 입니다.")
//print(yagombucks.pickUpTable)
