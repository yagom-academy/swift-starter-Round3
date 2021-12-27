//
//  Type.swift
//  CodeStarterCamp_Week3
//
//  Created by Jungmo Yu on 2021/12/24.
//

import Foundation

class Person {
    var name: String
    var money: UInt
    
    init(name: String, money: UInt) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(at coffeeShop: CoffeeShop, coffee: Coffee) {
        if self.money < coffee.price {
            print("잔액이 \(coffee.price - self.money)원만큼 부족합니다.")
        } else {
            let isOrderCompleted = coffeeShop.order(coffee: coffee, nameOfCustomer: self.name)
            self.money = isOrderCompleted ? (self.money - coffee.price) : self.money
        }
    }
}


class Barista: Person {
    func makeCoffee(coffee: Coffee) -> Bool {
        var finishedExtractCoffee = false
        finishedExtractCoffee = true
        
        return finishedExtractCoffee
    }
}


class CoffeeShop {
    var sales: UInt = 0
    var barista: Barista?
    var menu: [Coffee]
    var pickUpTable: Coffee?
    
    init(menu: [Coffee]) {
        self.menu = menu
    }
    
    func order(coffee: Coffee, nameOfCustomer: String) -> Bool {
        var isSucceed: Bool = false {
            didSet {
                print("\(nameOfCustomer) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
                pickUpTable = coffee
            }
        }
        
        if let barista = self.barista {
            isSucceed = barista.makeCoffee(coffee: coffee)
        } else {
            print("현재 카페에 바리스타가 없어서 커피를 만들 수 없습니다!")
        }
        
        self.sales += coffee.price
        return isSucceed
    }
}


enum Coffee {
    case americano
    case cafeLatte
    case cappuccino
    case hotChocolate
    
    var price: UInt {
        get {
            switch self {
            case .americano: return 4500
            case .cafeLatte: return 5500
            case .cappuccino: return 6000
            case .hotChocolate: return 5000
            }
        }
    }
}

