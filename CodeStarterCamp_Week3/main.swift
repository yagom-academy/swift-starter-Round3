//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int?
    var name: String?
    
    mutating func buySomething(_ price: Int) {
        guard var money = money else {
            print("There is nil in money")
            return
        }
        money = money - price
    }
    
    mutating func order(_ coffee: Coffee) {
        guard let money = money else {
            print("There is nil in money")
            return
        }
        guard let price = yagombucks.menu[coffee] else {
            print("There is nil in price")
            return
        }
        if money < price {
            print("잔액이 \(price - money)원만큼 부족합니다.")
        }
        else {
            yagombucks.make(coffee, from: self.name ?? "이름없음")
            buySomething(price)
            yagombucks.addRevenue(price)
        }
    }
}

struct CoffeeShop {
    var salesRevenue: Int = 10000000
    var coffeeType: Coffee?
    var pickUpTable: [(String, Coffee)] = []{
        willSet(newValue) {
            guard let orderInfo = newValue.last else {
                print("There is nil in orderInfo")
                return
            }
            print("\(orderInfo.0)님이 주문하신 \(orderInfo.1)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    var barista: Person?
    var menu: Dictionary = [Coffee.아메리카노:4000, .카푸치노:4500, .에스프레소: 3800]
    
    mutating func make(_ coffee: Coffee, from name: String) {
        pickUpTable.append((name, coffee))
    }
    mutating func addRevenue(_ revenue: Int) {
        salesRevenue = salesRevenue + revenue
    }
}

enum Coffee {
    case 아메리카노, 카푸치노, 에스프레소
}

var missKim = Person(money: 5000, name: "김여자")
var misterKim = Person(money: 6000, name: "김남자")
var yagombucks = CoffeeShop()
missKim.order(.아메리카노)
misterKim.order(.카푸치노)


