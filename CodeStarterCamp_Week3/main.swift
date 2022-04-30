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
        let coffeeAllCases = Coffee.allCases
        
        for coffee in coffeeAllCases {
            guard let price = coffeeShop.menuList[coffee], var buget = self.buget else { return }
            if menuName == coffee.rawValue {
                if buget >= price {
                    let coffeeShop = coffeeShop
                    coffeeShop.order(coffee, who: self)
                    buget -= price
                    self.buget = buget
                } else {
                    print("잔액이 \(price)원만큼 부족합니다")
                }
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
    var pickUpTable: [String: String] = [:] {
        willSet(newValue) {
            let name = newValue.keys.joined()
            print("\(name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
        didSet {
            pickUpTable.removeAll()
        }
    }
    
    var menuList: Dictionary<Coffee, Int> = [
        .americano : 3500,
        .latte : 4000,
        .vanillaLatte : 4500,
        .einspanner : 5500
    ]
    
    func order(_ coffee: Coffee, who order: Person) { }
    
    func makeCoffee(which info: [String: String], who barista: Person?) -> [String: String] {
        if let barista = barista {
            print("\(barista.name) 가 커피를 제조하는 중 입니다.")
            return info
        }
        return info
    }
    
    func putCoffeeOnPickUpTable(coffee: [String: String]) {
        for (name, menu) in coffee {
            pickUpTable[name] = menu
        }
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
