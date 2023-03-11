import Foundation

//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright :copyright: yagom academy. All rights reserved.
//

struct Person {
    var name: String
    var age: Int
    var cardBalance: Int
    
    
    mutating func orderMenu(coffeePrice: Int) {
        if cardBalance >= coffeePrice {
            cardBalance -= coffeePrice
            print("주문이 완료되었습니다.")
        }
        else {
            print("잔액 부족으로 주문이 취소되었습니다.")
        }
    }
}

enum Coffee {
    case americano, cappuccino, latte, espresso, mocha
}

struct CoffeeShop {
    var coffeeShopName: String
    var totalRevenue: Int = 0
    var coffeeMenu: [Coffee: Int] = [.americano: 4500, .cappuccino: 5000, .espresso: 4000, .latte: 5000, .mocha: 5500]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    mutating func takeOrder(likeCoffee: Coffee, customer: inout Person) {
        print("손님, 원하시는 음료 \(likeCoffee)가 맞으시나요?")
        print("결제 도와드리겠습니다.")
        if let orderCoffeePrice = coffeeMenu[likeCoffee] {
            print("주문하신 \(likeCoffee)의 가격은 \(orderCoffeePrice)원 입니다.")
            customer.cardBalance -= orderCoffeePrice
            totalRevenue += orderCoffeePrice
            print("결제가 완료되었습니다. 잠시만 기다려주세요.")
            for _ in 1...3 {
                print("...............................")
            }
            makeCoffee(cutomerOrder: likeCoffee)
        }
    }
    
    mutating func makeCoffee(cutomerOrder: Coffee) {
        print("주문하신 \(cutomerOrder)가 나왔습니다.")
        pickUpTable.append(cutomerOrder)
    }
}


var misterLee: Person = Person(name: "misterLee", age: 28, cardBalance: 400000)
var missKim: Person = Person(name: "missKim", age: 27, cardBalance: 600000)

var yagombucks: CoffeeShop = CoffeeShop(coffeeShopName: "yagombucks", barista: misterLee)
