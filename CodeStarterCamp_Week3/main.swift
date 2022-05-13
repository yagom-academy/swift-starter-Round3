//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//MARK: - Person 만들기

struct Person {
    var name: String
    var age: Int
    var money: Int
    var pastime: String?
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    mutating func buyCoffee(coffee: CoffeeShop.Menu, price: Int) -> String {
        var payment: String
        
        if money > price {
            money = money - price
            payment = yagombucks.order(coffee)
        } else {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(for: price)!
            payment = "잔액이 {\(result)}원만큼 부족합니다."
        }
        return payment
    }
    
    func enjoyLeisureTime() {
        if let pastime = pastime {
            print("\(name)은 '\(pastime)'을/를 즐깁니다.")
        } else {
            print("\(name)은 여가시간에 무엇을 할지 못 정했습니다.")
        }
    }
}

//MARK: - 커피샵차리기

class CoffeeShop {
    var salesRevenue: Int
    var pickUpTable: String?
    var music: String
    var barista: Person
    var mood: String
    var customer: Person!
    
    convenience init(salesRevenue: Int, pickUpTable: String, music: String, barista: Person, mood: String) {
        self.init(salesRevenue: salesRevenue, music: music, mood: mood, barista: barista)
        self.pickUpTable = pickUpTable
    }
    
    init(salesRevenue: Int, music: String, mood: String, barista: Person) {
        self.salesRevenue = salesRevenue
        self.music = music
        self.barista = barista
        self.mood = mood
    }
    
    func order(_ coffee: CoffeeShop.Menu) -> String {
        let orderMent = "\(customer.name)은 \(coffee)을/를 주문합니다."
        return orderMent
    }
    
    func takeOrder(coffee: Menu, beans: Beans, takeOutOrIn: String) -> String {
        var orderMent: String = ""
        
        switch coffee {
        case .iceAmericano, .hotAmericano, .iceCateLatte, .hotCateLatte, .onlyIceEinspener:
            orderMent =
                    """
                    안녕하세요 Yagombucks입니다. 저는 바리스타 \(barista.name)입니다. 방문해주셔셔 감사합니다.
                    \(beans)원두로 \(coffee), \(takeOutOrIn)으로 주문하셨습니다.
                    """
       default:
            orderMent = "안녕하세요 Yagombucks입니다. 저는 바리스타 \(barista.name)입니다. 방문해주셔셔 감사합니다.\n\(coffee)로 주문하셨습니다."
        }
        return orderMent
    }
    
    func calculate(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: price)!
        var paymentMent: String = "가격은 \(result)원입니다."
        
        if let pickUpTable = pickUpTable {
            paymentMent += "\n진동벨이 울리면 \(pickUpTable)로 와주세요😎"
        }
        
        salesRevenue += price
        return paymentMent
    }
    
    func createCoffee(menu: Menu) {
        print("\(menu)를 만든다.")
    }
    
    func giveCoffee() {
        if pickUpTable == nil {
            print("\(customer.name)님 커피드리겠습니다. 감사합니다. 맛있게 드세요😊")
        } else {
            print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요😊")
        }
    }
    
    func sayTodaySalesRevenue() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: salesRevenue)!
        let todaySalesRevenue = "오늘 총매출은 \(result)입니다."
        return todaySalesRevenue
    }
    
    //MARK: 메뉴구성
    enum Beans {
        case nutty
        case acidity
        case decaffeinated
    }
    
    enum Menu {
        case iceAmericano
        case hotAmericano
        case iceCateLatte
        case hotCateLatte
        case onlyIceEinspener
        case herbalTea
    }
}

//MARK: - 인스턴스 생성

var misterLee: Person = Person(name: "misterLee", age: 30, money: 100000)
var missKim: Person = Person(name: "missKim", age: 20, money: 10000)
missKim.pastime = "커피숍투어🍰☕️"
var yagombucks: CoffeeShop = CoffeeShop(salesRevenue: 0, pickUpTable: "좌측 픽업바", music: "Oasis - Wonderwall", barista: misterLee, mood: "Woody")

//MARK: - 구현
yagombucks.customer = missKim
print(missKim.buyCoffee(coffee: .iceAmericano, price: 4000))
print(yagombucks.takeOrder(coffee: .herbalTea, beans: .nutty, takeOutOrIn: "takeout"))
print(yagombucks.calculate(price: 4000))
yagombucks.createCoffee(menu: .herbalTea)
yagombucks.giveCoffee()

print(missKim.money)
print(yagombucks.salesRevenue)
