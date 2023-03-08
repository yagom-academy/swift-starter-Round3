//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var haveMoney: Int
    var nickName: String
    
    //커피 주문하는 함수
    mutating func orderCoffee(coffeePrice: Int, coffeeName: String) {
        if self.haveMoney >= coffeePrice {
            print("\(coffeeName) 주세요.")
            self.haveMoney -= coffeePrice
        }
        else {
            print("\(coffeePrice - self.haveMoney)원 만큼 돈이 부족하네")
        }
    }
    
}

struct CoffeeShop {
    var revenue: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    //커피 주문받고 만드는 함수
    mutating func makeCoffee(coffeePrice: Int, coffeeName: Coffee) {
        if coffeePrice > 0 {
            if let coffeePrice = menu[coffeeName] {
                self.revenue += coffeePrice
                putInPickUpTable(coffeeName: coffeeName)
            }
            else {
                print("해당 커피가 없습니다")
            }
        }
    }
    
    //커피 pickUpTable에 올려놓는 함수
    mutating func putInPickUpTable(coffeeName: Coffee) {
        print("주문하신 \(coffeeName)가 나왔습니다.")
        self.pickUpTable.append(coffeeName)
    }
    
}

enum Coffee: String{
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"
}

var misterLee = Person(haveMoney: 3500, nickName: "lee")
var missKim = Person(haveMoney: 10000, nickName: "kim")
var yagombucks = CoffeeShop(revenue: 0, menu: [.espresso: 3500, .cappuccino: 4000, .cafeLatte: 4500, .americano: 5000])
yagombucks.barista = misterLee
