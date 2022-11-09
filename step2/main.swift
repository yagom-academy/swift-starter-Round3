//
//  main.swift
//  step2
//
//  Created by jiye Yi on 2022/11/07.
//

import Foundation

class Person {
    var name: String
    var gender: String
    var moneyOnHand: Int
    var job: String
    init(name: String, gender: String, moneyOnHand: Int, job: String) {
        self.name = name
        self.gender = gender
        self.moneyOnHand = moneyOnHand
        self.job = job
    }
    
    func order(_ coffee: Coffee, at coffeeshop: Coffeeshop) {
        
        if let coffeePrice = coffeeshop.menuList[coffee] {
            
            if moneyOnHand >= coffeePrice {
                coffeeshop.make(coffee, from: name)
                moneyOnHand -= coffeePrice
                coffeeshop.turnover += coffeePrice
            } else {
                print("잔액이 \(coffeePrice - moneyOnHand) 만큼 부족합니다.")
            }
        }
    }
}

class Coffeeshop {
    let menuList = [Coffee.americano: 4500, Coffee.latte: 5000, Coffee.coldbrew: 5000, Coffee.frappuccino: 6000]
    var turnover: Int = Int()
    var barista: Person
    var orderedCoffee: Coffee?
    var customer: String?
    var pickUpTable = [Coffee]() {
        
        didSet {
            if let name = customer {
                if let orderedCoffee = orderedCoffee {
                    print("\(name)님이 주문하신 \(orderedCoffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
        
    }
    
    func make(_ coffee: Coffee, from name: String) {
        customer = name
        orderedCoffee = coffee
        pickUpTable.append(coffee)
    }
}


enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case coldbrew = "콜드브루"
    case frappuccino = "프라푸치노"
}


let missKim: Person = Person(name: "missKim", gender: "female", moneyOnHand: 7000, job: "student")
let misterLee: Person = Person(name: "misterLee", gender: "male", moneyOnHand: 50000, job: "barista")
let yagomBucks: Coffeeshop = Coffeeshop(barista: misterLee)

missKim.order(.americano, at: yagomBucks)
missKim.order(.coldbrew, at: yagomBucks)
print(yagomBucks.turnover)
