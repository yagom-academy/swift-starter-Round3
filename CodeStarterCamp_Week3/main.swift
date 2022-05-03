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
            guard let coffee = Coffee(rawValue: menuName), let price = coffeeShop.menuList[coffee], var buget = self.buget else { return }
            
            if buget >= price {
                coffeeShop.order(coffee)
                buget -= price
                self.buget = buget
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
        guard let price = self.menuList[coffee] else { return }
            
        let coffeeMenuName = coffee.rawValue

        calculate(menuPrice: price)
        putCoffeeOnPickUpTable(coffee: makeCoffee(who: self.barista, which: coffeeMenuName))
    }
    
    func calculate(menuPrice: Int) {
        self.revenue += menuPrice
        print("self.revenue : \(self.revenue)")
    }
    
    func makeCoffee(who barista: Person?, which menu: String) -> String {
        let error: String = "Error"
        if let barista = barista?.name {
            print("\(barista)가 \(menu)를 만들고 있습니다.")
            return menu
        }
        return error
    }
    
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
