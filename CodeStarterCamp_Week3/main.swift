//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int?
    
    mutating func buyCoffee(_ price:Int) {
        money = (money ?? 0)-price
    }
}

var person = Person()
person.money = 5000
person.buyCoffee(3000)
print("남은돈:",person.money ?? 0)

struct CoffeeShop {
    var take: Int = 10000000
    var coffeeType: Coffee?
    var price: Int = 0
    var pickUpTable: Array<Coffee> = []
    var barista: Person?
    
    // 주문받기
    mutating func takeOrder(_ coffeeType: Coffee, _ price: Int) {
        self.coffeeType = coffeeType
        self.price = price
        self.take = self.take + price
    }
    // 커피만들기
    mutating func makeCoffee(_ coffeeType: Coffee) {
        pickUpTable.append(coffeeType)
    }
}

enum Coffee {
    case americano, cappuccino, espresso
}

var misterLee = Person(money: 60000)
var misterKim = Person(money: 50000)
var yagombucks = CoffeeShop()

// yagombucks 바리스타 할당하기
yagombucks.barista = misterLee

// yagombucks 주문하기
yagombucks.takeOrder(.americano, 5000)

// yagombucks 커피만들기
yagombucks.makeCoffee(.americano)

// yagombucks 속성확인
print("커피종류:", yagombucks.coffeeType!)
print("커피가격:", yagombucks.price)
print("픽업테이블 목록:", yagombucks.pickUpTable)
print("바리스타:", yagombucks.barista ?? Person())
print("총 매출:", yagombucks.take)





