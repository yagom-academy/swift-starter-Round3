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
    
    func buy(pummok: String) {
        print("\(pummok) 사다")
    }
    
    func go(place: String) {
        print("\(place)으로 가다")
    }
}

struct CoffeeShop {
    var coffeeShopName: String
    var barista: Person
    var totMoney: Int = 0
    let coffeeMenuList: Dictionary<String, Int> = ["americano": 5000, "cafeLatte": 6500, "greenLatte": 6500, "cafeMocha": 7000]
    var pickUpTable: Array<String> = []
    
    func orderCoffee(type: String) {
        print("\(type) 주문이 들어왔다.")
        
        makeCoffee(type: type)
    }
    
    func makeCoffee(type: String) {
        print("\(type)을(를) 만든다.")
        
        pickUpTable(type: type)
    }
    
    func pickUpTable(type: String){
        print("주문하신 \(type) 나왔습니다.")
    }
}

enum Coffee {
    case americano
    case cafeLatte
    case greenLatte
    case cafeMocha
}
