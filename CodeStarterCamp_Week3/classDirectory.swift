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
    var bag: Array<Any> = Array<Any>()
    
    func buyObject(payMoney: Int) -> Int {
        if self.money > payMoney {
            self.money = self.money - payMoney
            return payMoney
        } else {
            let lackMoney = payMoney - self.money
            print("잔액이 \(lackMoney)원만큼 부족합니다.")
            return 0
        }
    }
    
    init(name: String){
        self.name = name
    }
    
}

class CoffeeShop {
    var menu: Dictionary<Coffee, Int> = Dictionary<Coffee, Int>()
    var salesTotal: Int = 0
    var pickUpTable: Coffee? = nil
    var barista: Person

    init(barista: Person){
        self.barista = barista
    }
    
    func getOrder(person:inout Person,orderedCoffee: Coffee) {
        if let coffeePrice = self.menu[orderedCoffee] {
            let money: Int = person.buyObject(payMoney: coffeePrice)
            salesTotal += money
            if money != 0 {
                self.pickUpTable = orderedCoffee
                print("\(person.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가 주세요.")
            }
        } else {
            print("존재하지 않는 메뉴 입니다!")
        }
    }
}

enum Coffee {
    case arrabica
    case yogu
    case mix
    case yegerChef
}
