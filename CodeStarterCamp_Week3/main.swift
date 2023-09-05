//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//MARK: - Coffee 열거형 정의
enum Coffee {
    case americano
    case latte
    case cappuccino
    case chocofrappuccino
    
    func price() -> Int {
        switch self {
        case .americano:
            return 1500
        case .latte:
            return 2000
        case .cappuccino:
            return 2500
        case .chocofrappuccino:
            return 3500
        }
    }
}

//MARK: - Person 클래스 정의
class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func buyCoffee(coffee: Coffee) {
        money -= coffee.price()
    }
}

//MARK: - CoffeeShop 클래스 정의
class CoffeeShop {
    var revenue: Int
    var menu: [Coffee]
    var barista: Person?
    var pickUpTable: [Coffee]
    
    init(revenue: Int, menu: [Coffee], pickUpTable: [Coffee]) {
        self.revenue = revenue
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func takeOrder(coffee: Coffee) {
        revenue += coffee.price()
        pickUpTable.append(coffee)
    }
}


//Person 타입의 인스턴스로 misterLee , missKim을 생성.
let misterLee = Person(name: "misterLee", age: 23, money: 10000)
let missKim = Person(name: "missKim", age: 33, money: 5000)

//CoffeeShop 타입의 인스턴스로 yagombucks을 생성.
let yagombucks = CoffeeShop(revenue: 0, menu: [.americano, .cappuccino, .latte, .chocofrappuccino], pickUpTable: [])

//바리스타를 misterLee로 할당.
yagombucks.barista = misterLee

//카페라떼 주문.
yagombucks.takeOrder(coffee: .latte)

//아메리카노 주문.
yagombucks.takeOrder(coffee: .americano)

//매출액 확인.
print("yagombucks의 매출액은 \(yagombucks.revenue)원 입니다.")

//pickUpTable 확인.
print("yagombucks의 pickUpTable은 \(yagombucks.pickUpTable)입니다.")

//missKim이 커피주문후 가진 돈 확인
missKim.buyCoffee(coffee: .americano)
print("\(missKim.name)의 돈은 \(missKim.money)입니다")
