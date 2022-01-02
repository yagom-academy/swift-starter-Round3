//
//  classDirectory.swift
//  CodeStarterCamp_Week3
//
//  Created by 곽우종 on 2022/01/01.
//

import Foundation

class Person {
    var money: Int = 0
    var bag: Array<Any> = Array<Any>()
    
    func buyObject(payMoney: Int) {
        if self.money > payMoney {
            self.money = self.money - payMoney
        } else {
            print("돈이 부족합니다!")
        }
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
    
    func getOrder(orderedCoffee: Coffee) -> Coffee? {
        if let coffeePrice = self.menu[orderedCoffee] {
            salesTotal += coffeePrice
            return makeCoffee(orderedCoffee: orderedCoffee)
        } else {
            print("존재하지 않는 메뉴 입니다!")
            return nil
        }
    }
    
    func makeCoffee(orderedCoffee: Coffee) -> Coffee {
        print("주문하신 \(orderedCoffee) 커피 나왔습니다.")
        return orderedCoffee
    }
    

}

enum Coffee {
    case arrabica
    case yogu
    case mix
    case yegerChef
}
