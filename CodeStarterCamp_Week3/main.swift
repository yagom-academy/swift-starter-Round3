//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - STEP1

class Person {
    var defaultBuget: Int = 0
    
    func buyDrink(at coffeeShop: CoffeeShop, which menuName: String) {
        guard let menu = coffeeShop.menuList[menuName] else { return }
        
        switch menu {
        case .coffee(let price):
            self.defaultBuget -= price
        case .nonCoffee(let price):
            self.defaultBuget -= price
        }
    }
    init(defaultBuget: Int) {
        self.defaultBuget = defaultBuget
    }
}

enum Coffee {
    case coffee(price: Int)
    case nonCoffee(price: Int)
}


// Store 에 상속하기 위해 class 선언
class CoffeeShop {
    var 매출액: Int = 0
    
    var menuList: Dictionary<String, Coffee> = [
        // coffee
        "Americano": .coffee(price: 0),
        "Einspanner": .coffee(price: 0),
        "Latte": .coffee(price: 0),
        "Vanilla Latte" : .coffee(price: 0),
        // nonCoffee
        "Pineapple Ade": .nonCoffee(price: 0),
        "Milk Tea": .nonCoffee(price: 0)
    ]
    
    func getOrder() { } // order 에 따라 매출액 추가
    func makeMenu() { }
    
}

// CoffeeShop 상속받기 위해 class Type
class Store: CoffeeShop  {
    
    var test: Dictionary<String, Coffee> = [
        "Special Americano": .coffee(price: 50000)
    ]
    
    override var menuList: Dictionary<String, Coffee> {
        get {
            return test
        }
        set {
            
        }
    }
}


let yagombucks: Store = Store()

let misterLee: Person = Person(defaultBuget: 100000)

print(misterLee.defaultBuget)
misterLee.buyDrink(at: yagombucks, which: "Americano")
// 여기서 작동안함 > Americano 가 menuList 에 없음
print(misterLee.defaultBuget)
misterLee.buyDrink(at: yagombucks, which: "Special Americano")
print(misterLee.defaultBuget)
// 값을 받아와서 함수가 작동하는 건 확인함
// 각 Store 별 메뉴 가격이 다르니 이 부분을 Override 해서 수정해야함



