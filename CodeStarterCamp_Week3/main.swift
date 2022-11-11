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
        if money >= (shop.menu[coffee] ?? 0) {
            print("\(name)가 \(shop.name)에 \(coffee)를 주문합니다.")
            
            money = money - (shop.menu[coffee] ?? 0)
            print("\(name)이(가) 커피 주문 이후 남은 돈은 \(money) 입니다.")
            
            shop.dropCoffee(coffee, from: name)
        } else {
            print("잔액이 부족해서 주문을 할 수가 없어요. 지못미 ㅠ.ㅠ...")
        }
    }
}

/// CoffeeShop 타입을 정의합니다.
/// 1. 프로퍼티 매출액, 메뉴판(커피, 가격), 픽업테이블, 바리스타
/// 2. 메서드: 주문받기, 커피제작
class CoffeeShop {

    var name: String
    var revenue: Int
    var menu: [Coffee : Int]
    var orderNumber = 0
    var pickUpTable: [Coffee] {
        willSet {
            print("\(name)이 주문하신 \(newValue[orderNumber])가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    var baristar = Person(name: "Harry", age: 20, money: 10000)
    
    init(name: String, revenue: Int, menu: [Coffee : Int], pickUpTable: [Coffee]) {
        self.name = name
        self.revenue = revenue
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func dropCoffee(_ coffee: Coffee, from name: String) {
        pickUpTable.append(coffee)
        orderNumber += 1
       
        revenue = revenue + (menu[coffee] ?? 0)
        print("\(name)의 현재 매출은 \(revenue) 입니다.")
    }
    
}

enum Coffee {
    case americano, cafelatte, greentea
}

var missKim = Person(name: "Jane", age: 30, money: 3000)
var yagombucks = CoffeeShop(name: "yagombucks", revenue: 3550, menu:  [ .americano : 1000, .cafelatte : 1800, .greentea : 1500], pickUpTable: [])

missKim.orderCoffee(order: .americano, to: yagombucks)
missKim.orderCoffee(order: .greentea, to: yagombucks)
missKim.orderCoffee(order: .cafelatte, to: yagombucks)




