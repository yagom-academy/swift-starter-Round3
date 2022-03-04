//
//  step2.swift
//  CodeStarterCamp_Week3
//
//  Created by makseong on 2022/03/04.
//

import Foundation

class Person {
    var name : String
    var property : Int
    
    init(name: String, property : Int) {
        self.name = name
        self.property = property
    }
    
    func buy(beverage: Coffee, in coffeeShop: CoffeeShop) {
        switch beverage {
        case .americano(let price):
            if property < price {
                print("잔액이 \(price-property)원만큼 부족합니다.")
            }else{
                property -= price
                coffeeShop.order(beverage:beverage)
            }
        case .tea(let price):
            if property < price {
                print("잔액이 \(price-property)원만큼 부족합니다.")
            }else{
                property -= price
                coffeeShop.order(beverage:beverage)
            }
        case .juice(let price):
            if property < price {
                print("잔액이 \(price-property)원만큼 부족합니다.")
            }else{
                property -= price
                coffeeShop.order(beverage:beverage)
            }
        }
    }
}

class CoffeeShop {
    var totalSale : Int = 0
    var menu : [Coffee] = [.americano(price:4500), .tea(price:2500), .juice(price:3000)]
    var pickUpTable : Array<String> = []
    var baristas : Person

    init(baristas: Person) {
        self.baristas = baristas
    }

    func order(beverage: Coffee) {
        switch beverage {
        case .americano(let price):
            totalSale += price
        case .tea(let price):
            totalSale += price
        case .juice(let price):
            totalSale += price
        }
        make(beverage: beverage)
    }
    
    func make(beverage : Coffee) {
        switch beverage {
        case .americano:
            pickUpTable.append("아메")
            print("\(self.baristas.name) 님의 아메가 준비 되었습니다. 픽업대에서 가져가주세요.")
        case .tea:
            pickUpTable.append("티")
            print("\(self.baristas.name) 님의 티가 준비 되었습니다. 픽업대에서 가져가주세요.")
        case .juice:
            pickUpTable.append("주스")
            print("\(self.baristas.name) 님의 주스가 준비 되었습니다. 픽업대에서 가져가주세요.")
        }
        
        print("손님 맛있게드세요.")
        
        _ = pickUpTable.removeFirst()
    }
}

enum Coffee {
    case americano(price: Int)
    case tea(price: Int)
    case juice(price: Int)
}
