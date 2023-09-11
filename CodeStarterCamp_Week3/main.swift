//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee{
    case espresso, americano, latte
    var name : String{
        switch self{
        case .espresso:
            return "espresso"
        case .americano:
            return "americano"
        case .latte:
            return "latte"
        }
    }
}
struct Person{
    var name : String
    var money : Int = 10000
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop){
        if money < coffeeShop.setCoffeeValue{
            print("잔액이 부족합니다")
        }else{
            money -= coffeeShop.setCoffeeValue
            print("\(coffee.name)를 주문합니다")
        }
    }
}
struct CoffeeShop{
    let barista : Person
    var sales : Int = 0
    var menuBoard : [Coffee:Int] = [:]
    var pickUpTable : [Coffee] = []
    var setCoffeeValue : Int
    
    mutating func make(_ coffee : Coffee, from name : String){
        print("\(coffee.name)를 만들고 있습니다.")
        sales += setCoffeeValue
    }
    func showPickUpTable(_ coffee : Coffee, customer : Person){
        print("\(customer.name)님이 주문하신 \(coffee.name)(이/가) 준비 되었습니다.", terminator: "")
        print("픽업대에서 가져가 주세요.")
    }
}
var minsterLee = Person(name: "minsterLee")
var missKim = Person(name: "missKim")

var yagombucks = CoffeeShop(barista: minsterLee, setCoffeeValue: 3000)
