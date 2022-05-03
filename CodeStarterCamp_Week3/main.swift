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
    var name: String = ""
    var buget: Int?
    
    init(name: String) {
        self.name = name
    }
}

class Customer: Person {
    func buyDrink(which menuName: String, at coffeeShop: CoffeeShop) {
        let menuNameArr = Coffee.allCases.map { $0.rawValue }
        
        if menuNameArr.contains(menuName) {
            guard let caseValues = Coffee(rawValue: menuName), let price = coffeeShop.menuList[caseValues], let buget = self.buget else { return }
            
            if buget >= price {
                coffeeShop.order(caseValues)
            } else {
                print("잔액이 \(price)원만큼 부족합니다")
            }
        }
    }
}

enum Coffee: String, CaseIterable {
    case americano = "Americano"
    case latte = "Latte"
    case vanillaLatte = "Vanila Latte"
    case einspanner = "Einspanner"
}

class CoffeeShop {

    var revenue: Int = 0
    var barista: Person?
    var menuList: Dictionary<Coffee, Int> = [
        .americano : 3500,
        .latte : 4000,
        .vanillaLatte : 4500,
        .einspanner : 5500
    ]
    
    var pickUpTable: String? {
        willSet(newMenu) {
            guard let newMenu = newMenu else { return }
            print("\(newMenu)가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    func order(_ coffee: Coffee) {

    }
    
    func makeCoffee(who barista: Person?) { }
    
    func putCoffeeOnPickUpTable(coffee: String) {
        self.pickUpTable = coffee
    }
}

// MARK: - 실행부

let missKim = Customer(name: "missKim")
let misterLee = Person(name: "misterLee")
let yagombucks = CoffeeShop()
yagombucks.barista = misterLee

missKim.buget = 3500
missKim.buyDrink(which: "Americano", at: yagombucks)
missKim.buyDrink(which: "Americano", at: yagombucks)
