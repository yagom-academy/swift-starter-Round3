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
    
    func buyDrink(at coffeeShop: CoffeeShop, which menuName: String){
        guard let menu = coffeeShop.menuList[menuName] else { return }
        guard var buget = self.buget else { return }
        
        switch menu {
        case .americano(let price), .vanillaLatte(let price), .latte(let price), .einspanner(let price):
            if buget < price {
                print("잔액이 \(price)원 만큼 부족합니다")
            } else {
                let 커피샵 = coffeeShop
                커피샵.order(menu, who: self)
                
                buget -= price
                self.buget = buget
            }
        }
    }
}

enum Coffee {
    case americano(price: Int)
    case latte(price: Int)
    case vanillaLatte(price: Int)
    case einspanner(price: Int)
}

class CoffeeShop {
    var revenue: Int?
    var barista: Person?
    var pickUpTable: Array<String?> = []
    var menuList: Dictionary<String, Coffee> = [
        "Americano": .americano(price: 3500) ,
        "Einspanner": .einspanner(price: 5500),
        "Latte": .latte(price: 4000),
        "Vanilla Latte" : .vanillaLatte(price: 4500)
    ]
    
    func order(_ coffee: Coffee, who order: Person) {
        
        if var revenue = self.revenue {
            switch coffee {
            case .americano(let price), .vanillaLatte(let price), .latte(let price), .einspanner(let price):
                revenue += price
                self.revenue = revenue
            }
        }
        
    }
    
    func makeCoffee() { }
}

// MARK: - 실행부


let shop = CoffeeShop()
shop.revenue = 0
let 주문자 = Customer(name: "재현")
주문자.buget = 4600

print("주문자.buget : \(주문자.buget!)")
print("shop.revenue : \(shop.revenue!)")
주문자.buyDrink(at: shop, which: "Americano")
print("주문자.buget : \(주문자.buget!)")
print("shop.revenue : \(shop.revenue!)")

