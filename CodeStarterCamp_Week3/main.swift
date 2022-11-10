//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// Person 타입을 정의합니다.
/// 1. 프로퍼티:  돈
/// 2. 메서드: 커피 구입
class Person {
 
    var name: String = "Harry"
    var age: Int = 20
    var money: Int = 0
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func orderCoffee(order coffee: Coffee, to shop: CoffeeShop) {
        print("\(name)가 \(shop.name)에 \(coffee)를 주문합니다.")
        shop.dropCoffee(coffee, from: name)
        money = money - (shop.menu[coffee] ?? 0)
    }
    
}

/// CoffeeShop 타입을 정의합니다.
/// 1. 프로퍼티 매출액, 메뉴판(커피, 가격), 픽업테이블, 바리스타
/// 2. 메서드: 주문받기, 커피제작
class CoffeeShop {

    var name: String = "yagombucks"
    var revenue: Int = 0
    var menu: [Coffee : Int]
    var pickUpTabel: [Coffee] = []
    var baristar = Person(name: "Harry", age: 20, money: 10000)
    
    init(name: String, revenue: Int, menu: [Coffee : Int], pickUpTabel: [Coffee], baristar: Person = Person(name: "Harry", age: 20, money: 10000)) {
        self.name = name
        self.revenue = revenue
        self.menu = menu
        self.pickUpTabel = pickUpTabel
        self.baristar = baristar
    }
    
    func dropCoffee(_ coffee: Coffee, from name: String) {
        pickUpTabel.append(coffee)
        print("\(name)이 주문하신 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
        revenue = revenue + (menu[coffee] ?? 0)
    }
    
}

enum Coffee {
    case americano, cafelatte, greentea
}

var missKim = Person(name: "Jane", age: 30, money: 15000)
var yagombucks = CoffeeShop(name: "yagombucks", revenue: 3550, menu:  [ .americano : 1000, .cafelatte : 1800, .greentea : 1500], pickUpTabel: [])

print(missKim.orderCoffee(order: .americano, to: yagombucks))

print("\(missKim.name)이 커피 주문 이후 남은 돈은 \(missKim.money) 입니다.")
print("\(yagombucks.name)이 현재 매출은 \(yagombucks.revenue) 입니다.")
