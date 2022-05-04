//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by Jiyoung Lee on 2022/05/01.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(at cafe: CoffeeShop, coffee: Coffee) -> Int {
        let coffeePrice = cafe.menuBoard[coffee]
        
        if money >= coffeePrice ?? 0 {
            money -= coffeePrice ?? 0
            cafe.order(coffee)
            print("\(name)님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
            return money
        } else {
            print("잔액이 \((coffeePrice ?? 0) - money)원만큼 부족합니다.")
            return money
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    var menuBoard: [Coffee: Int] = [:]
    var pickUpTable: Array<Coffee>?
    
    
    func order(_ coffee: Coffee) {
        sales += menuBoard[coffee] ?? sales
        pickUpTable?.append(coffee)
    }

    
    func addMenu(coffee: Coffee, price: Int) {
        menuBoard[coffee] = price
    }
}

enum Coffee {
    case americano, latte, mocha
}
