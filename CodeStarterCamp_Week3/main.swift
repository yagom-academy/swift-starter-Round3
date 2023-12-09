//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// Person Class 타입
struct Person {
    var nickName: String
    var balance: Int = 0
    
    init(nickName: String, balance: Int) {
        self.nickName = nickName
        self.balance = balance
    }
    
    /// 커피를 구매하는 함수
    /// - Parameters:
    ///   - coffee: 커피 종류
    ///   - coffeeShop: 커피매장
    ///   - name: 주문자 닉네임
    mutating func makeOrder(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if (coffee.rawValue > self.balance) {
            print("잔액이 \(coffee.rawValue - self.balance)원만큼 부족합니다.")
        } else {
            self.balance -= coffee.rawValue
            coffeeShop.receiveOrder(coffee, by: name)
        }
    }
}

/// CoffeeShop Class 타입
class CoffeeShop {
    var shopName: String
    var barista: Person
    var revenue: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    
    init(shopName: String, barista: Person) {
        self.shopName = shopName
        self.barista = barista
    }
    
    /// 주문을 받는 함수
    /// - Parameters:
    ///   - coffee: 커피 종류
    ///   - name: 주문자 닉네임
    func receiveOrder(_ coffee: Coffee, by name : String) {
        self.revenue += coffee.rawValue
        self.makeCoffee(coffee, from: name)
    }
    /// 커피를 만드는 함수
    /// - Parameters:
    ///   - coffee: 커피 종류
    ///   - name: 주문자 닉네임
    func makeCoffee(_ coffee: Coffee, from name: String) {
        self.pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

/// Coffee 열거형
enum Coffee: Int {
    case 에스프레소 = 4000
    case 아메리카노 = 4500
    case 라떼 = 5000
    case 모카 = 5500
}

var misterLee = Person(nickName: "misterLee", balance: 4700)
var missKim = Person(nickName: "missKim", balance: 8300)
let yagombucks = CoffeeShop(shopName: "yagombucks", barista: misterLee)

missKim.makeOrder(.아메리카노, of: yagombucks, by: "missKim")
missKim.makeOrder(.라떼, of: yagombucks, by: "missKim")
