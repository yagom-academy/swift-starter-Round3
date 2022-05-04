//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//class Person {
//    private var money: Int
//
//    init(money: Int) {
//        self.money = money
//    }
//
//    func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
//        if let coffeePrice = coffeeShop.menu[coffee] {
//                money = money - coffeePrice
//        }
//        coffeeShop.orderCoffee(coffee)
//    }
//
//    var getMoney: Int {
//        get {
//            return money
//        }
//    }
//}

struct Person {
    private var money: Int
    var name: String
    
    mutating func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        if let coffeePrice = coffee.getPrice {
            if money >= coffeePrice {
                money = money - coffeePrice
            } else {
                print("잔액이 \(coffeePrice - money)원 만큼 부족합니다. ")
                return
            }
        }
        coffeeShop.orderCoffee(coffee, name)
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    var getMoney: Int {
        get {
            return self.money
        }
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person?
    var orderer: String?
    let menu: [Coffee] = [Coffee.espresso, Coffee.americano, Coffee.macchiato,
                               Coffee.cappuccino, Coffee.caffeLatte, Coffee.affogato]
    
    var pickUpTable: Bool = false {
        didSet {
            if pickUpTable, let orderer = orderer  {
                print("\(orderer) 님의 커피가 준비되엇습니다. 픽업대에서 가져가주세요.")
                pickUpTable = false                 //주문된 커피가 픽업테이블에 올라갔기 때문에 다시 false로 변경.
            }
        }
    }
    
    init(sales: Int) {
        self.sales = sales
    }
    
    func orderCoffee(_ coffee: Coffee, _ orderer: String) {
        if let coffeePrice = coffee.getPrice {
            self.sales += coffeePrice
            self.orderer = orderer
            pickUpTable = true
        }
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case macchiato = "마끼아또"
    case cappuccino = "카푸치노"
    case caffeLatte = "카페라떼"
    case affogato = "아포가토"
    
    var getPrice: Int? {   // 구조체 타입의 연산프로퍼티 (열거형에선 저장프로퍼티X)
        switch self {   // self = Rank
        case .espresso:
            return 1000  // Value 타입의 인스턴스 반환
        case .americano, .caffeLatte:
            return 1500
        case .macchiato, .cappuccino:
            return 2000
        case .affogato:
            return 2500
        default:
            return nil
        }
    }
}

var missKim: Person = Person(name: "missKim", money: 10000)

var misterLee: Person = Person(name: "misterLee", money: 0)


var yagombucks: CoffeeShop = CoffeeShop(sales: 0)
yagombucks.barista = misterLee

missKim.buyCoffee(Coffee.espresso, yagombucks)

print("주문후 잔액은 \(missKim.getMoney) 입니다.")

