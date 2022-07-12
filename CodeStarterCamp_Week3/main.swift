//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var nickName: String? // String? 프로퍼티의 초기값이 꼭 필요 없을 때 사용.
    var money: Int
    
    // 하나의 이니셜라이저로 옵셔널 프로퍼티값을 선택적으로 초기화
    init(name: String, age: Int, nickName: String = "", money: Int) {
        self.name = name
        self.age = age
        self.nickName = nickName
        self.money = money
    }
    
    func drink() {
        print("마시다")
    }
    
    func go() { //go(to: somePlace)
        print("가다")
    }
    
    func order(coffee: Coffee) -> Coffee {
        print("\(coffee)를 주문하다")
        
        return coffee
    }
}

struct CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int] = [.americano: 2000, .cappuccino: 2500, .espresso: 1500, .flatWhite: 3000, .latte: 2500, .macchiato: 3000, .mocha: 2500 ]
    var pickUpTable: [Coffee] = []
    var barista: Person?
        
    //init()을 하지 않은 이유: struct에서 제공하는 memberwise 이니셜라이즈를 사용해보기 위함.
    
    func takeOrder(guest: Person, orderedCoffee: Coffee) {
        if let price = menu[orderedCoffee] {
            print("\(orderedCoffee) 주문을 받았다.")
            print("\(guest.name)님, \(orderedCoffee)는 \(price)원 입니다.")
            guest.money -= price
        } else {
            print("해당 커피의 가격이 정해지지 않았습니다.")
        }
    }
    
    mutating func makeCoffee(orderedCoffee: Coffee) { // make(coffee)
        print("커피를 만들다")
        pickUpTable.append(orderedCoffee)
    }
    
}

enum Coffee: String {
    case latte, cappuccino, americano, espresso, flatWhite, macchiato, mocha
}


var misterLee = Person(name: "misterLee", age: 30, nickName: "jin", money: 50000)
var missKim = Person(name: "missKim", age: 20, nickName: "jenny", money: 10000)
var missPark = Person(name: "missPark", age: 30, money: 40000)
//var missKim = Person(name: "missKim", age: 29, money: 39000)
var yagombucks = CoffeeShop(sales: 100000)
yagombucks.barista = misterLee


//------- 실행 테스트용 --------//
/*
var missKimOrder = missKim.order(coffee: .americano)
print(missKim.money)
yagombucks.takeOrder(guest: missKim, orderedCoffee: missKimOrder)
print(missKim.money)

yagombucks.makeCoffee(orderedCoffee: missKimOrder)
print(yagombucks.pickUpTable)

missKimOrder = missKim.order(coffee: .flatWhite)
print(missKim.money)
yagombucks.takeOrder(guest: missKim, orderedCoffee: missKimOrder)
print(missKim.money)

yagombucks.makeCoffee(orderedCoffee: missKimOrder)
print(yagombucks.pickUpTable)

if let baristaName = yagombucks.barista?.name {
    print(baristaName)
}
*/
