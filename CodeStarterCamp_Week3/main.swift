//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Person 타입 정의
struct Person {
    var name: String
    var money: Double
    
    init(name: String, money: Double) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        
    }
}

// CoffeeShop 타입 정의
struct CoffeeShop {
    var revenue: Double
    var menu: [CoffeeType: Double]
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    init(revenue: Double, menu: [CoffeeType: Double]) {
        self.revenue = revenue
        self.menu = menu
    }
    
    mutating func make(_ coffee: Coffee, from name: String) {
        let coffee = Coffee(type: coffee.type)
        pickUpTable.append(coffee)
        print("issKim 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}


// CoffeeShop과 Person 인스턴스 생성
var yagombucks = CoffeeShop(revenue: 10, menu: [.espresso: 2.5, .latte: 3.0, .cappuccino: 3.5])
var misterLee = Person(name: "Mr. Lee", money: 20.0)
var missKim = Person(name: "Ms. Kim", money: 15.0)

// yagombucks의 바리스타를 misterLee로 할당
yagombucks.barista = misterLee

// Coffee 타입(열거형) 정의
enum CoffeeType {
    case espresso, latte, cappuccino
}

// Coffee 타입 정의
struct Coffee {
    var type: CoffeeType
}



