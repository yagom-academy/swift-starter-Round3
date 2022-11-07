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
struct Person {
 
    var name: String = "Harry"
    var age: Int = 20
    var money: Int = 0
    
    func orderCoffee() {
    }
    
}

/// CoffeeShop 타입을 정의합니다.
/// 1. 프로퍼티 매출액, 메뉴판(커피, 가격), 픽업테이블, 바리스타
/// 2. 메서드: 주문받기, 커피제작
struct CoffeeShop {
    
    var revenue: Int = 0
    var menu: [Coffee : Int] = [:]
    var pickUpTabel: [Coffee] = []
    var baristar = Person()
    
    func takeOrder() {
    }
    
    func dropCoffee(_ coffee: Coffee) -> Coffee {
        return coffee
    }
    
}

enum Coffee {
    case americano, cafelatte, greentea
}

var misterLee = Person()
var missKim = Person()
var yagombucks = CoffeeShop()

misterLee.name = "Potter"
yagombucks.baristar = misterLee
print(yagombucks.baristar)

yagombucks.pickUpTabel.append(yagombucks.dropCoffee(.americano))
print(yagombucks.pickUpTabel)
