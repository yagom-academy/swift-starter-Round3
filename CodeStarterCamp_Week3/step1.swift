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
        if totalMoney >= spendMoney {
            calculateMoney(spendMoney: spendMoney)
            return true
        } else {
            return false
        }
    }
    
    private func calculateMoney(spendMoney: Int) {
        totalMoney = totalMoney - spendMoney
        print("커피가 계산 되었습니다. 총 잔액은 \(totalMoney)원 입니다.")
    }
    
    init (totalMoney: Int) {
        self.totalMoney = totalMoney
    }
}

class CoffeShop {
    var salesRevenue: Int
    var menus: [Menu]
    var pickUpTable: [Coffee] {
        willSet {
            print("모든 음료의 제조가 완료되었습니다. 픽업 부탁드립니다:)")
        }
    }
    var barista: Person? = nil {
        willSet (newValue) {
            if newValue != nil {
                print("새로운 바리스타가 등장하였습니다!")
            }
        }
    }
    
    init(menus: [Menu]) {
        print("카페가 생겼어요!!!")
        self.salesRevenue = 0
        self.menus = menus
        self.pickUpTable = []
    }
    
    struct Menu {
        var coffee: Coffee
        var price: Int
    }
    
    enum Coffee {
        case Americano
        case CaffeeLatte
        case CaffeeMocha
    }
    
    func takeOrder(person: Person, coffees: Coffee...) {
        guard barista != nil else {
            print("현재 주문을 받을 수 있는 바리스타가 없어요ㅠㅠ")
            return
        }
        
        if coffees.count == 0 {
            print("받은 주문이 없어요ㅠㅠ")
            return
        }
        
        let totalPrice = getTotalPrice(coffees: coffees)
        if totalPrice > 0 {
            print("총 \(totalPrice)원 입니다.")
            checkCanMakeCoffee(person: person, price: totalPrice, coffees: coffees)
        }
    }
    
    private func makeCoffee(coffees: [Coffee]) {
        coffees.forEach { coffee in
            print("\(coffee) 제조가 완료되었습니다.")
        }
        
        pickUpTable = pickUpTable + coffees
    }
    
    private func getTotalPrice(coffees: [Coffee]) -> Int {
        var price = 0
        
        for coffee in coffees {
            let menuOrNil = menus.filter({ $0.coffee == coffee }).first
            
            guard let menu = menuOrNil else {
                print("#주문을 받는중 오류가 발생하였습니다#")
                price = 0
                break
            }
            
            print("\(menu.coffee) 주문 받았습니다.")
            price = price + menu.price
        }
        
        return price
    }
    
    private func checkCanMakeCoffee(person: Person, price: Int, coffees: [Coffee]) {
        if person.buyCoffee(spendMoney: price) {
            makeCoffee(coffees: coffees)
            salesRevenue = salesRevenue + price
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
