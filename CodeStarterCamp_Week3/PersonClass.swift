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
    
    func buyCoffee(shop: CoffeeShop, coffee: CoffeeList){
        print("\(self.name): \(coffee) 주세요")
        shop.takeOrderTo(coffee: coffee, guest: self)
        if haveMoney >= coffee.price {
        haveMoney -= coffee.price
        bringCoffee(shop: shop, coffee: coffee)
        } else {
            print("\(self.name): 앗! 돈이 부족하군요 다음에 다시오겠습니다")
        }
    }
    
    func bringCoffee(shop: CoffeeShop, coffee: CoffeeList) {
        shop.pickUpTable.removeValue(forKey: self.name)
        print("\(self.name): \(coffee)를 픽업대에서 가져왔습니다")
    }
}
