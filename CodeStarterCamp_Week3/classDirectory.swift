//
//  classDirectory.swift
//  CodeStarterCamp_Week3
//
//  Created by 곽우종 on 2022/01/01.
//

import Foundation

class Person {
    var money: Int = 0
    var name: String
    
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func buyObject(productPrice: Int) -> Int {
        if self.money >= productPrice {
            self.money = self.money - productPrice
            return productPrice
        } else {
            return self.money
        }
    }
}

class CoffeeShop {
    var menu: Dictionary<Coffee, Int> = Dictionary<Coffee, Int>()
    var salesTotal: Int = 0
    var pickUpTable: Coffee? {
        didSet(oldValue){
            if let coffeeCustomer = self.customer {
                print("\(coffeeCustomer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가 주세요.")
            }
        }
    }
    var barista: Person
    var customer: Person?

    init(barista: Person){
        self.barista = barista
    }
    
    func getOrder(person: Person, orderedCoffee: Coffee) {
        self.customer = person
        if let coffeePrice = self.menu[orderedCoffee] {
            let money: Int = person.buyObject(productPrice: coffeePrice)
            if money < coffeePrice {
                print("잔액이 \(coffeePrice-money)부족합니다!")
            } else {
                salesTotal += money
                self.pickUpTable = orderedCoffee
            }
        } else {
            print("존재하지 않는 메뉴 입니다!")
        }
    }
}

enum Coffee {
    case arrabica, yogu, mix, yegerChef
}
