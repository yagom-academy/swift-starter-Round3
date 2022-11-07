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

    var money: Int = 0
    
    func orderCoffee() {
    }
    
}

/// CoffeeShop 타입을 정의합니다.
/// 1. 프로퍼티 매출액, 메뉴판(커피, 가격), 픽업테이블, 바리스타
/// 2. 메서드: 주문받기, 커피제작
struct CoffeeShop {
    
    var revenue: Int = 0
    var menu: [String : Int] = [:]
    var pickUpTabel: [Coffee] = []
    var barista: String = ""
    
    func takeOrder() {
    }
    
    func dropCoffee(_ coffee: Coffee) -> Coffee {
        return coffee
    }
    
}

enum Coffee {
    case americano, cafelatte, greentea
}

var misterLee: Person = Person()
var missKim: Person = Person()
var yagombucks: CoffeeShop = CoffeeShop()

yagombucks.barista = "misterLee"
yagombucks.pickUpTabel.append(yagombucks.dropCoffee(.americano))
print(yagombucks.pickUpTabel)
