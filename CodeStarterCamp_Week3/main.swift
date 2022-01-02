//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var asset: Int
    var name: String
    func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(name) ordered \(coffee)")
        coffeeShop.takeOrder(coffee: coffee)
    }
    
    init(name: String, asset: Int) {
        self.name = name
        self.asset = asset
    }
}

class CoffeeShop {
    var turnover: Int = 0
    var pickUpTable: Dictionary<String, Coffee>? = [String: Coffee]()
    var baristar: Person = Person(name: "misterLee", asset: 30000)
    var customer: Person?
    var menu: Dictionary<Coffee, Int> = [Coffee.americano : 4500,
                                         Coffee.cafeLatte : 5000,
                                         Coffee.cafeMocha : 5000,
                                         Coffee.vanillaLatte : 6000]
    
    func takeOrder(coffee: Coffee) {
        let priceOfCoffee = coffee.priceOfCoffee
        guard let customerAsset = customer?.asset else {return}
        guard let customerName = customer?.name else {return}

        if customerAsset < priceOfCoffee {
            let lackOfMoney: Int = priceOfCoffee - customerAsset
            print("잔액이 \(lackOfMoney)원만큼 부족합니다.\n")
        } else {
            updateAsset(coffee: coffee)
            brewCoffee(customer: customerName, coffee: coffee)
            print("고객 잔액 : \(customer?.asset ?? 0), 커피 가격 : \(menu[coffee] ?? 0), 카페 이익 : \(turnover)\n")
        }
    }
    
    func updateAsset(coffee: Coffee) {
        customer?.asset -= coffee.priceOfCoffee
        turnover += coffee.priceOfCoffee
    }
    
    func brewCoffee(customer: String, coffee: Coffee) {
        print("baristar \(baristar.name) is now brewing \(customer)'s \(coffee)...")
        pickUpTable?[customer] = coffee
        guard let coffeeOnPickUpTable = pickUpTable?[customer] else {
            return print("픽업대가 비었습니다.")
        }
        print("\(customer)님의 \(coffeeOnPickUpTable)가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: Int {
    case americano
    case cafeLatte
    case cafeMocha
    case vanillaLatte
    
    var priceOfCoffee: Int {
        switch self {
        case .americano:
            return 4500
        case .cafeLatte:
            return 5000
        case .cafeMocha:
            return 5000
        case .vanillaLatte:
            return 6000
        }
    }
}

var missKim: Person = Person(name: "missKim", asset: 3000)
var marisol: Person = Person(name: "marisol", asset: 50000)
var yagombucks: CoffeeShop = CoffeeShop()

yagombucks.customer = marisol
marisol.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
marisol.orderCoffee(coffeeShop: yagombucks, coffee: .cafeMocha)
marisol.orderCoffee(coffeeShop: yagombucks, coffee: .cafeLatte)
yagombucks.customer = missKim
missKim.orderCoffee(coffeeShop: yagombucks, coffee: .vanillaLatte)
