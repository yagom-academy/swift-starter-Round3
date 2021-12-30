//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var asset: Int
    var name: String
    var job: String
    mutating func purchaseSomeThing(price: Int) -> Int {
        asset -= price
        return asset
    }
}

struct CoffeeShop {
    var turnover: Int
    var pickUpTable: Dictionary<String, Coffee>? = [String: Coffee]()
    var baristar: Person
    var menu: Dictionary<Coffee, Int> = [Coffee.americano : 4500,
                                         Coffee.cafeLatte : 5000,
                                         Coffee.cafeMocha : 5500,
                                         Coffee.vanillaLatte : 6000]
    
    mutating func order(customer: Person, coffee: Coffee) {
        var assetOfCustomer = customer.asset
        let priceOfCoffee = coffee.rawValue
        var turnoverOfCoffeeShop = turnover
        
        if assetOfCustomer < priceOfCoffee {
            let lackOfMoney: Int = priceOfCoffee - assetOfCustomer
            print("잔액이 \(lackOfMoney)원만큼 부족합니다.\n")
        } else {
            assetOfCustomer -= priceOfCoffee
            turnoverOfCoffeeShop += priceOfCoffee
            brewCoffee(customer: customer.name, coffee: coffee)
            print("고객 잔액 : \(assetOfCustomer), 커피 가격 : \(coffee.rawValue), 카페 이익 : \(turnoverOfCoffeeShop)\n")
        }
    }
    
    mutating func brewCoffee(customer: String, coffee: Coffee) {
        print("baristar \(baristar.name) is now brewing \(customer)'s \(coffee)...")
        guard ((pickUpTable?[customer] = coffee) != nil) else {
            return print("픽업대가 비었습니다.")
        }
        print("\(customer)님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
        
        
    }
}

enum Coffee: Int {
    case americano = 4500
    case cafeLatte = 5000
    case cafeMocha = 5500
    case vanillaLatte = 6000
}

var misterLee: Person = Person(asset: 20000, name: "misterLee", job: "baristar")
var missKim: Person = Person(asset: 3000, name: "missKim", job: "iOSDeveloper")
var marisol: Person = Person(asset: 50000, name: "marisol", job: "student")
var yagombucks: CoffeeShop = CoffeeShop(turnover: 0, baristar: misterLee)

yagombucks.order(customer: missKim, coffee: Coffee.americano)
yagombucks.order(customer: marisol, coffee: Coffee.cafeLatte)
yagombucks.order(customer: marisol, coffee: Coffee.americano)
