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
        guard (self.money > coffee.price) else {
            print("잔액이 \(coffee.price - self.money)원만큼 부족합니다.")
            return
        }
        
        do {
            try coffeeShop.order(coffee: coffee, nameOfCustomer: self.name)
        } catch CoffeeShopError.noBaristaError { return }
        catch {print("default ERROR")}
    
        self.money -= coffee.price
    }
}


class Barista: Person {
    func makeCoffee(coffee: Coffee) {
        print("\(coffee)를 만들었습니다!")
    }
}


class CoffeeShop {
    private var sales: UInt = 0
    private var menu: [Coffee] = []
    var barista: Barista?
    var pickUpTable: Coffee?
    
    init(menu: [Coffee]) {
        self.menu = menu
    }
    
    func isBaristaExist(barista: Barista?) -> Bool {
        guard let _ = barista else {
            return false
        }
        return true
    }
    
    func order(coffee: Coffee, nameOfCustomer: String) throws {
        guard isBaristaExist(barista: self.barista) else {
            print("현재 카페에 바리스타가 없어서 커피를 만들 수 없습니다!")
            throw CoffeeShopError.noBaristaError
        }
        if let barista = self.barista {
            barista.makeCoffee(coffee: coffee)
            self.pickUpTable = coffee
        }
        self.sales += coffee.price
        print("매출이 \(coffee.price)원 만큼 증가하여 \(self.sales)원이 되었습니다.")
        print("\(nameOfCustomer) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}


enum Coffee {
    case americano
    case cafeLatte
    case cappuccino
    case hotChocolate
    
    var price: UInt {
        switch self {
        case .americano: return 4500
        case .cafeLatte: return 5500
        case .cappuccino: return 6000
        case .hotChocolate: return 5000
        }
    }
}

enum CoffeeShopError: Error {
    case noBaristaError
}
