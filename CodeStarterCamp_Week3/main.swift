//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Person 타입 정의
class Person {
    var money: Double
    
    init(money: Double) {
        self.money = money
    }
    
    func buyCoffee(from coffeeShop: CoffeeShop, coffeeType: Coffee) {
        if let coffeePrice = coffeeShop.menu[coffeeType] {
            if money >= coffeePrice {
                money -= coffeePrice
                coffeeShop.takeOrder(coffeeType)
            } else {
                print("돈이 부족합니다.")
            }
        } else {
            print("메뉴에 없는 커피입니다.")
        }
    }
}


// Coffee 타입(열거형) 정의
enum Coffee {
    case americano
    case latte
    case cappuccino
    case mocha
}


// CoffeeShop 타입 정의
class CoffeeShop {
    var salesRevenue: Double = 0000
    var menu: [Coffee: Double]
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    init(menu: [Coffee: Double]) {
        self.menu = menu
    }
    
    func takeOrder(_ coffeeType: Coffee) {
        if let price = menu[coffeeType] {
            salesRevenue += price
            makeCoffee(coffeeType)
        } else {
            print("메뉴에 없는 커피 주문입니다.")
        }
    }
    
    func makeCoffee(_ coffeeType: Coffee) {
        pickUpTable.append(coffeeType)
        print("\(coffeeType)가 제조되었습니다.")
    }
}


// Person 타입의 인스턴스 생성
let misterLee = Person(money: 5000)
let missKim = Person(money: 3000)


// CoffeeShop 타입의 인스턴스 생성
let yagombucksMenu: [Coffee: Double] = [.americano: 1000, .latte: 1000, .cappuccino: 1100, .mocha: 1000]
let yagombucks = CoffeeShop(menu: yagombucksMenu)


// yagombucks의 바리스타를 misterLee로 할당
yagombucks.barista = misterLee


