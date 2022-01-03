//
//  PersonStruct.swift
//  CodeStarterCamp_Week3
//
//  Created by 김동욱 on 2021/12/30.
//

import Foundation

class Person {
    var name: String
    var haveMoney: Int
    
    
    init(name: String, haveMoney: Int){
        self.name = name
        self.haveMoney = haveMoney
    }
    
    func buyItCoffee(shop: CoffeeShop, coffee: CoffeeList){
        print("\(self.name): \(coffee) 주세요")
        if haveMoney > coffee.price {
            shop.takeOrderTo(coffee: coffee, guest: self)
            haveMoney -= coffee.price
        } else {
            print("잔액이 \(coffee.price - haveMoney)원만큼 부족합니다. ")
        }
        
    }
}


