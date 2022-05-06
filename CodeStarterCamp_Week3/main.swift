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
    var name : String
    var age : Int
    var money : Int
    var pastime : String?
    
 init(name: String, age: Int, money: Int,  pastime: String) {
        self.init(name: name, age: age, money: money)
        self.pastime = pastime
    }
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    mutating func buyCoffee() -> String {
        
        let order = "\(name)은 커피를 주문합니다."
        return order
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
    var salesRevenue : Int
    var pickUpTable : String?
    var music : String
    var barista : Person!
    var mood : String
    
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
    
    func takeOrder(manu: Manu, takeOutOrIn: String) -> String {
        var orderMent : String =
"""
"안녕하세요 Yagombucks입니다. 저는 바리스타 \(barista.name)입니다. 방문해주셔셔 감사합니다.
\(manu), \(takeOutOrIn)으로 주문하셨습니다.
"""
        
        if let pickUpTable = pickUpTable {
            orderMent += " \n 진동벨이 울리면 \(pickUpTable)로 와주세요😎"
        }
        return orderMent
    }
    
    func Calculate(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let price = price
        let result = numberFormatter.string(for: price)!
        let count : String = "가격은 \(result)원입니다."
        
        salesRevenue += price
        return count
    }
    
    func createDrick(manu: Manu) {
        print("\(manu)를 만든다.")
    }
    
    func giveDrink() {
        print("감사합니다. 맛있게 드세요😊")
    }
    
    func sayTodaySalesRevenue() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: salesRevenue)!
        let todaySalesRevenue = "오늘 총매출은 \(result)입니다."
        return todaySalesRevenue
    }
}

