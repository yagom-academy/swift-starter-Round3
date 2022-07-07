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
    mutating func buyCoffee(_ price:Int) {
        money = (money ?? 0) - price
    }
    
    mutating func order(_ coffee: Coffee) {
        if var money = money {
            if let price = yagombucks.menu[coffee] {
                if money < price {
                    print("잔액이 \(price - money)원만큼 부족합니다.")
                }
                else {
                    yagombucks.make(coffee, from: self.name ?? "이름없음")
                    money = money - price
                    yagombucks.salesRevenue = yagombucks.salesRevenue + price
                }
            }
            else {
                print("There is nil in price")
            }
        }
        else {
            print("There is nil in money")
        }
    }
}

struct CoffeeShop {
    var salesRevenue: Int = 10000000
    var coffeeType: Coffee?
    var pickUpTable: Array<Coffee> = []
    var barista: Person?
    var menu: Dictionary = [Coffee.아메리카노:4000, .카푸치노:4500, .에스프레소: 3800]
    
    mutating func make(_ coffee: Coffee, from name: String) {
        // pickUpTable에 올리기, 문구 출력하기
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee {
    case 아메리카노, 카푸치노, 에스프레소
}

var missKim = Person()
missKim.money = 500
missKim.name = "김여자"
var yagombucks = CoffeeShop()
missKim.order(.아메리카노)


