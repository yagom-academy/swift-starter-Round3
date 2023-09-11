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
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if money >= coffee.price() {
            coffeeShop.make(coffee, from: name)
            money -= coffee.price()
        } else {
            print("\(name)의 잔액이 \(coffee.price() - money)원만큼 부족합니다.")
        }
    }
}

//MARK: - CoffeeShop 클래스 정의
class CoffeeShop {
    var revenue: Int
    var menu: [Coffee]
    var barista: Person?
    var orderCoffee: Coffee
    var orderName: String
    var pickUpTable: [Coffee] {
        willSet {
            print("\(orderName) 님이 주문하신 \(orderCoffee)(이/가) 준비중입니다.")
        }
        didSet {
            print("\(orderName) 님이 주문하신 \(orderCoffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    init(revenue: Int = 0, menu: [Coffee] = [.americano, .cappuccino, .latte, .chocofrappuccino], pickUpTable: [Coffee] = [], orderCoffee: Coffee = .americano, orderName: String = "") {
        self.revenue = revenue
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.orderCoffee = orderCoffee
        self.orderName = orderName
    }
    
    func make(_ coffee: Coffee, from name: String) {
        revenue += coffee.price()
        orderCoffee = coffee
        orderName = name
        pickUpTable.append(coffee)
    }
}


//Person 타입의 인스턴스로 misterLee, missKim, coda를 생성.
let misterLee = Person(name: "misterLee", age: 23, money: 10000)
let missKim = Person(name: "missKim", age: 33, money: 5000)
let coda = Person(name: "Coda", age: 50, money: 50000)

//CoffeeShop 타입의 인스턴스로 yagombucks을 생성.
let yagombucks = CoffeeShop()

//바리스타를 misterLee로 할당.
yagombucks.barista = misterLee

//missKim이 카페라떼 주문.
missKim.order(.latte, of: yagombucks, by: missKim.name)

//coda가 초코프라푸치노 주문.
coda.order(.chocofrappuccino, of: yagombucks, by: coda.name)

//매출액 확인.
print("yagombucks의 매출액은 \(yagombucks.revenue)원 입니다.")

//pickUpTable 확인.
let pickUpTableMessage = yagombucks.pickUpTable.isEmpty ? "주문이 없습니다." : "yagombucks의 pickUpTable은 \(yagombucks.pickUpTable.map { String(describing: $0) }.joined(separator: ", "))입니다."
print(pickUpTableMessage)


//커피주문후 가진 돈 확인
print("\(missKim.name)의 돈은 \(missKim.money)입니다.")
print("\(coda.name)의 돈은 \(coda.money)입니다.")
