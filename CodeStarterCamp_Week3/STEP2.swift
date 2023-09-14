//
//  STEP2.swift
//  CodeStarterCamp_Week3
//
//  Created by DOYEON JEONG on 2023/09/14.
//

import Foundation

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("\(coffee.rawValue)는(은) 메뉴에 없는 커피입니다.")
            return
        }
        
        guard money >= price else {
            print("잔액이 \(price - money)원만큼 부족합니다.")
            return
        }
        
        coffeeShop.order(coffee, by: name)
        money -= price
        
    }
}

class CoffeeShop {
    var revenue: Int = 0
    var menu: [Coffee: Int]
    var barista: Person
    var pickUpTable: [String] = []
    
    init(barista: Person, menu: [Coffee: Int]) {
        self.barista = barista
        self.menu = menu
    }
    
    func order(_ coffee:Coffee, by name:String) {
        guard let price = self.menu[coffee] else { return }
        
        revenue += price
        make(coffee, from:name)
    }
    
    private func make(_ coffee:Coffee, from name:String){
        pickUpTable.append(coffee.rawValue)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
