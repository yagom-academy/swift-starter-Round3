//
//  WEEK3 STEP1.swift
//  CodeStarterCamp_Week3
//
//  Created by oh namjun on 2022/07/14.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    var sex: String
    var money: Int
    
    func buyThing(thing: String) {
        print("\(thing) 사다")
    }
    
    func goPlace(place: String) {
        print("\(place)으로 가다")
    }
}

struct CoffeeShop {
    var coffeeShopName: String
    var barista: Person
    var sales: Int = 0
    let coffeeMenuList: Dictionary<String, Int> = ["americano": 5000, "cafeLatte": 6500, "greenLatte": 6500, "cafeMocha": 7000]
    var pickUpTable: Array<Coffee> = []
    
    func orderCoffee(coffee: String) {
        print("\(coffee) 주문이 들어왔다.")
        
        makeCoffee(baristaName: barista.name,coffee: coffee)
    }
    
    func makeCoffee(baristaName: String, coffee: String) {
        print("\(baristaName)가 \(coffee)을(를) 만든다.")
        
        finishCoffee(coffee: coffee)
    }
    
    func finishCoffee(coffee: String){
        print("주문하신 \(coffee) 나왔습니다.")
    }
}

enum Coffee {
    case americano
    case cafeLatte
    case greenLatte
    case cafeMocha
}
