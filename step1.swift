//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by Jiyoung Lee on 2022/05/01.
//

import Foundation

class Person {
    var money: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buyCoffee(coffee: Coffee) {
        let coffeeShop: CoffeeShop = CoffeeShop()
        let coffeePrice = coffeeShop.menuBoard[coffee]
        
        if money >= coffeePrice ?? 0 {
            money -= coffeePrice ?? 0
            coffeeShop.order(coffee)
            print("\(name)님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
        } else {
            print("잔액이 \((coffeePrice ?? 0) - money)원만큼 부족합니다.")
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
