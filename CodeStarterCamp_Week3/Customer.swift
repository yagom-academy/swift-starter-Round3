//
//  Customoer.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/05/01.
//

import Foundation

class Customer: Person {
    override init(name: String, money: Int) {
        super.init(name: name, money: money)
    }
    
    func isSufficeMoney(coffeePrice: Int) -> Bool {
        return coffeePrice <= money
    }
    
    func orderCoffee(coffee: Coffee, coffeeShop: CoffeeShop) {
        guard let coffeePrice = coffeeShop.getPriceOfCoffeeFromMenu(coffee: coffee) else {
            print("존재하지 않는 메뉴입니다.")
            return
        }
        
        if isSufficeMoney(coffeePrice: coffeePrice) == false {
            print("잔액이 \(coffeePrice - money)만큼 부족합니다.")
            return
        }
        
        submitMoney(coffeePrice: coffeePrice)
        coffeeShop.insertOrderToPickUpTable(orderMan: name, coffee: coffee)
        coffeeShop.order(coffee: coffee)
    }
}
