//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright :copyright: yagom academy. All rights reserved.
//

class Person {
    var name: String
    var age: Int
    var cardBalance: Int
    
    init(name: String, age: Int, cardBalance: Int) {
        self.name = name
        self.age = age
        self.cardBalance = cardBalance
    }
    
    func orderMenu(coffeePrice: Int) {
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
    case americano, capuccino, latte, espresso, mocha
}

struct CoffeeShop {
    var coffeeShopName: String
    var totalRevenue: Int = 0
    var coffeeMenu: [Coffee: Int] = [.americano: 4500, .capuccino: 5000, .espresso: 4000, .latte: 5000, .mocha: 5500]
    var pickUpTable: [Coffee] = []
    var barista: Person
        
    mutating func takeOrder(orderCoffee: Coffee, customer: Person) {
        print("손님, 원하시는 음료 \(orderCoffee) 맞으시나요?")
        print("결제 도와드리겠습니다.")
        if let orderCoffeePrice = coffeeMenu[orderCoffee] {
            print("주문하신 \(orderCoffee)의 가격은 \(orderCoffeePrice) 입니다.")
            customer.cardBalance -= orderCoffeePrice
            totalRevenue += orderCoffeePrice
            print("결제가 완료되었습니다. 잠시만 기다려주세요.")
            for _ in 1...3 {
                print("...............................")
            }
            makeCoffee(cutomerCoffee: orderCoffee)
        }
    }
    
    mutating func makeCoffee(cutomerCoffee: Coffee) {
        print("주문하신 \(cutomerCoffee)가 나왔습니다.")
        pickUpTable.append(cutomerCoffee)
    }
    
    func findTotalRevenue() {
        print("금일 매출액은 \(totalRevenue)원 입니다.")
    }
}


var misterLee: Person = Person(name: "misterLee", age: 28, cardBalance: 400000)
var missKim: Person = Person(name: "missKim", age: 27, cardBalance: 600000)
var yagombucks: CoffeeShop = CoffeeShop(coffeeShopName: "yagombucks", barista: missKim)

yagombucks.takeOrder(orderCoffee: .americano, customer: missKim)

yagombucks.findTotalRevenue()
