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
    private var money: Int {
        didSet {
            print("주문후 잔액은 \(money) 입니다.")
        }
    }
    var name: String
    
    mutating func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        if money >= coffee.menuPrice {
            money = money - coffee.menuPrice
        } else {
            print("잔액이 \(coffee.menuPrice - money)원 만큼 부족합니다. ")
            return
        }
        
        coffeeShop.orderCoffee(coffee, name)
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person?
    var orderer: String?
    var coffee: String?
    let menu: [Coffee] = [.espresso, .americano, .macchiato, .cappuccino, .caffeLatte, .affogato]
    
    var pickUpTable: Bool = false {
        didSet {
            if pickUpTable, let orderer = orderer, let coffee = coffee  {
                print("\(orderer) 님의 \(coffee)가 준비되엇습니다. 픽업대에서 가져가주세요.")
                pickUpTable = false                 //주문된 커피가 픽업테이블에 올라갔기 때문에 다시 false로 변경.
            }
        }
    }
    
    init(sales: Int) {
        self.sales = sales
    }
    
    func orderCoffee(_ coffee: Coffee, _ orderer: String) {
        self.sales += coffee.menuPrice
        self.orderer = orderer
        self.coffee = coffee.menuName
        pickUpTable = true
    }
}

enum Coffee{
    case espresso
    case americano
    case macchiato
    case cappuccino
    case caffeLatte
    case affogato
    
    var menuPrice: Int {   // 구조체 타입의 연산프로퍼티 (열거형에선 저장프로퍼티X)
        switch self {   // self = Rank
        case .espresso:
            return 1000  // Value 타입의 인스턴스 반환
        case .americano, .caffeLatte:
            return 1500
        case .macchiato, .cappuccino:
            return 2000
        case .affogato:
            return 2500
        }
    }
    
    var menuName: String {
        switch self {
        case .espresso:
            return "에스프레소"
        case .americano:
            return "아메리카노"
        case .caffeLatte:
            return "카페라떼"
        case .macchiato:
            return "마끼아또"
        case .cappuccino:
            return "카푸치노"
        case .affogato:
            return "아포카토"
        }
    }
}


var missKim: Person = Person(name: "missKim", money: 10000)

var misterLee: Person = Person(name: "misterLee", money: 0)


var yagombucks: CoffeeShop = CoffeeShop(sales: 0)
yagombucks.barista = misterLee

missKim.buyCoffee(Coffee.espresso, yagombucks)


