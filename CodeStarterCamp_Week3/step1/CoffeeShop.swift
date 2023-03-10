//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by suyeon park on 2023/03/10.
//

import Foundation

enum Coffee: String {
    case Americano = "아메리카노"
    case CaffeeLatte = "카페라떼"
    case CaffeeMocha = "카페모카"
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
    
    init(menus: [Menu], salesRevenue: Int = 0, pickUpTable: [Coffee] = []) {
        print("카페가 생겼어요!!!")
        self.salesRevenue = salesRevenue
        self.menus = menus
        self.pickUpTable = pickUpTable
    }
    
    struct Menu {
        var coffee: Coffee
        var price: Int
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
            print("\(coffee.rawValue) 제조가 완료되었습니다.")
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
            
            print("\(menu.coffee.rawValue) 주문 받았습니다.")
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
