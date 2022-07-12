//
//  step2.swift
//  CodeStarterCamp_Week3
//
//  Created by 한서영 on 2022/07/11.
//

import Foundation

enum Coffee: String {
    case latte, mocha, coldBrew, espresso, americano, cappuccino
}

class Person {
    enum Gender {
        case woman, man
    }

    private var name: String
    private var age: Int
    private var money: Int
    private var nationality: String
    private var gender: Gender

    init(name: String, age: Int, money: Int, nationality: String, gender: Gender) {
        self.name = name
        self.age = age
        self.money = money
        self.nationality = nationality
        self.gender = gender
    }

    func getOld() {
        self.age += 1
        print("현재 나이는 \(self.age)입니다.")
    }

    func order(from coffeeShop: CoffeeShop, _ coffee: Coffee) {
        let price = coffeeShop.getOrder(coffee)
        
        if price != -1 {
            if self.money >= price {
                self.money -= price
                coffeeShop.increaseSalesAmount(coffeePrice: price)
                print("\(price)원 커피를 구매하였습니다.\n잔액은 \(self.money)입니다.")
                
                coffeeShop.make(coffee, from: self.name)
            } else {
                print("잔액이 \(price - self.money)원만큼 부족합니다.")
            }
        }
    }
}

class CoffeeShop {
    private var salesAmount: Int = 0
    var menu: Dictionary<Coffee, Int> = [Coffee.americano: 4500, Coffee.cappuccino: 5000, Coffee.coldBrew: 5500, Coffee.espresso: 4000, Coffee.latte: 5000, Coffee.mocha: 5300]
    var pickUpTable: Array<Coffee> = []
    private var barista: Person

    init(barista: Person) {
        self.barista = barista
    }

    func make(_ coffee: Coffee, from name: String) {
        self.pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }

    func changeMenuPrice(of name: Coffee, to newPrice: Int) {
        if let price: Int = self.menu[name] {
            self.menu[name] = newPrice
            print("\(name.rawValue)를 \(price)원 으로 변경했습니다")
        } else {
            print("해당 메뉴는 판매하지 않습니다.")
        }
    }
     
    func increaseSalesAmount(coffeePrice: Int) {
        self.salesAmount += coffeePrice
    }
    
    func getOrder(_ coffee: Coffee) -> Int {
        if let price: Int = self.menu[coffee] {
            return price
        } else {
            print("해당 메뉴는 판매하지 않습니다.")
            return -1
        }
    }
}
