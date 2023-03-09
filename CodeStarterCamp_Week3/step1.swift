//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by suyeon park on 2023/03/09.
//

import Foundation

class Person {
    var totalMoney: Int
    
    func buyCoffee(spendMoney: Int) -> Bool {
        if  totalMoney >= spendMoney {
            totalMoney = totalMoney - spendMoney
            print("커피가 계산 되었습니다. 총 잔액은 \(totalMoney)원 입니다.")
            return true
        } else {
            return false
        }
    }
    
    init (totalMoney: Int) {
        self.totalMoney = totalMoney
    }
}

class CoffeShop {
    var salesRevenue: Int = 0
    var menus: [Menu]
    var pickUpTable: [Coffee] = []
    var barista: Person? = nil {
        willSet (newValue) {
            if newValue != nil {
                print("바리스타가 생겼습니다!")
            }
        }
    }
    
    init(menus: [Menu]) {
        print("카페가 생겼어요!!!")
        self.menus = menus
    }
    
    struct Menu {
        var coffeeKind: Coffee
        var price: Int
    }
    
    enum Coffee {
        case Americano
        case CaffeeLatte
        case CaffeeMocha
    }
    
    func takeOrder(person: Person, coffees: [Coffee]) {
        
        if barista != nil {
            
            var price = 0
            
            coffees.forEach { coffee in
                let menu = menus.filter({ $0.coffeeKind == coffee }).first
                
                if let menu = menu {
                    print("\(menu.coffeeKind) 주문 받았습니다.")
                    price = price + menu.price
                }
            }
            
            print("총 \(price)원 입니다.")
            
            if missKim.buyCoffee(spendMoney: price) {
                makeCoffee(coffees: coffees)
                salesRevenue = price
            } else {
                print("잔액이 부족합니다.")
            }
        } else {
            print("현재 주문을 받을 수 있는 바리스타가 없어요ㅠㅠ")
        }
    }
    
    private func makeCoffee(coffees: [Coffee]) {
        print("커피 만드는 중입니다...")
        
        coffees.forEach { coffee in
            print("주문하신 \(coffee)가 나왔습니다.")
        }
        
        pickUpTable = coffees
    }
}
