//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by marisol on 2022/01/03.
//

import Foundation

class CoffeeShop {
    var turnover: Int = 0
    var pickUpTable: Coffee? {
        willSet(coffeeToBrew) {
            if let customerCoffee = coffeeToBrew, let customerName = customer?.name {
                print("\(customerName)님의 \(customerCoffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
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
            brewCoffee(customerName: customerName, coffee: coffee)
            print("고객 잔액 : \(customer?.asset ?? 0), 커피 가격 : \(menu[coffee] ?? 0), 카페 이익 : \(turnover)\n")
        }
    }
    
    func updateAsset(coffee: Coffee) {
        customer?.asset -= coffee.priceOfCoffee
        turnover += coffee.priceOfCoffee
    }
    
    func brewCoffee(customerName: String, coffee: Coffee) {
        print("바리스타 \(baristar.name)가 \(customerName)님의 \(coffee)를 준비하고 있습니다...")
        pickUpTable = coffee
    }
}
