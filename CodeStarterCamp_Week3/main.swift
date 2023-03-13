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
    
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        print("손님, 원하시는 음료 \(coffee.rawValue)가 맞으시나요?")
        
        if let orderCoffeePrice = coffeeShop.coffeeMenu[coffee] {
            print("결제 도와드리겠습니다.")
            print("주문하신 \(coffee.rawValue)의 가격은 \(orderCoffeePrice)원 입니다.")
            
            if cardBalance >= orderCoffeePrice {
                self.cardBalance -= orderCoffeePrice
                coffeeShop.totalRevenue += orderCoffeePrice
                
                coffeeShop.receipt(coffee, self, orderCoffeePrice)
                
                coffeeShop.make(coffee, for: name)
            }
            else {
                print("잔액이 \(orderCoffeePrice - cardBalance)원만큼 부족합니다.")
            }
        }
    }
}

enum Coffee: String{
    case americano = "아메리카노"
    case cappuccino = "카푸치노"
    case latte = "라떼"
    case espresso = "에스프레소"
    case mocha = "모카"
}

class CoffeeShop {
    var coffeeShopName: String
    var totalRevenue: Int = 0
    var coffeeMenu: [Coffee: Int] = [.americano: 4500, .cappuccino: 5000, .espresso: 4000, .latte: 5000, .mocha: 5500]
    var pickUpTable: [Coffee.RawValue: String] = [:]
    var barista: Person?
    var customer: Person?
    
    init(coffeeShopName: String) {
        self.coffeeShopName = coffeeShopName
    }
    
    func receipt(_ coffee: Coffee, _ customer: Person, _ coffeePrice: Int) {
        print("결제가 완료되었습니다. 잠시만 기다려주세요.")
        print(".........................")
        print("...........영수증..........")
        print("\(coffee.rawValue): \(coffeePrice)원")
        print("카드 잔액: \(customer.cardBalance)원")
        print(".........................")
        print(".........................")
    }
    
    func make(_ coffee: Coffee, for name: String) {
        print("-------------------------")
        print("--------커피 추출 중--------")
        print("-------------------------")
        pickUpTable[coffee.rawValue] = "\(name)"
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        tableScreen()
    }
    
    func tableScreen() {
        print(pickUpTable)
    }
}


var misterLee: Person = Person(name: "misterLee", age: 28, cardBalance: 400000)
var missKim: Person = Person(name: "missKim", age: 27, cardBalance: 600000)
var yagombuck: CoffeeShop = CoffeeShop(coffeeShopName: "yagombuck")

yagombuck.customer = missKim

missKim.order(.espresso, of: yagombuck, by: missKim.name)
