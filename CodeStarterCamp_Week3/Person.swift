//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Jay Shin on 3/1/24.
//

struct Person {
    var name: String
    var money: Int
        
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        print("\(name)이(가) \(coffeeShop.name)에서 \(coffee.rawValue)를 주문합니다.")
        
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                money -= price
                coffeeShop.totalSales += price
                print("\(price)원 결제가 완료되었습니다. (\(name)님의 현재 잔액: \(money)원)")
                coffeeShop.make(coffee, from: name)
            } else {
                print("잔액이 \(price - money)원만큼 부족합니다. (\(name)님의 현재 잔액: \(money)원")
            }
        } else {
            print("요청하신 메뉴는 없는 메뉴입니다.")
        }
    }
}
