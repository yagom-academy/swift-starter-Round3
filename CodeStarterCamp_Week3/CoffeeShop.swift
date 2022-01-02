//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by marisol on 2022/01/03.
//

import Foundation

class CoffeeShop {
    var turnover: Int = 0
    var pickUpTable: Dictionary<String, Coffee>? {
        willSet {
            print("baristar \(baristar.name) is now brewing \(customer?.name ?? "")'s coffee...")
        }
        didSet {
            guard let coffeeOnPickUpTable = pickUpTable?[customer?.name ?? ""] else {
                return print("픽업대가 비었습니다.")
            }
            print("\(customer?.name ?? "")님의 \(coffeeOnPickUpTable)가 준비되었습니다. 픽업대에서 가져가주세요.")
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
        pickUpTable?[customerName] = coffee
    }
}
