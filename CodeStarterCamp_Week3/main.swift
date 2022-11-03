//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: Person 타입 정의
class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func selfIntroduce() {
        print("제 이름은 \(name)이고 \(age)살 입니다. 소지금은 \(money)입니다.")
    }
    
    func orderingCoffee(coffee: Coffee) {
        print("\(coffee.rawValue)를 주문합니다.")
    }
}

// MARK: CoffeeShop 타입 정의
struct CoffeeShop {
    let cafeName: String
    var revenue: Int = 0
    var menu: Dictionary<Coffee, Int> =
    [Coffee.americano : Coffee.americano.price, Coffee.espresso : Coffee.espresso.price, Coffee.cafeLatte : Coffee.cafeLatte.price,
     Coffee.cafeMocha : Coffee.cafeMocha.price, Coffee.vanillaLatte : Coffee.vanillaLatte.price, Coffee.cappuccino : Coffee.cappuccino.price,
     Coffee.affogato : Coffee.affogato.price, Coffee.caramelMacchiato : Coffee.caramelMacchiato.price]
    var pickUpTable: Array<Coffee> = []
    var barista: Person?
    
    func selfIntroduce() {
        if let barista = barista {
            print("어서오세요 \(cafeName)입니다. 바리스타 \(barista.name)라고 합니다.")
        } else {
            print("어서오세요 \(cafeName)입니다.")
        }
    }
    
    mutating func takeOrder(coffee: Coffee){
        print("\(cafeName)에서 \(coffee.rawValue)를 주문받았습니다.")
        makeCoffee(coffee: coffee)
    }
    
    mutating func makeCoffee(coffee: Coffee) {
        print("\(cafeName)에서 \(coffee.rawValue)를 만들었습니다.")
        pickUpTable.append(coffee)
        print("주문하신음료 \(coffee.rawValue)가 \(cafeName)의 픽업테이블에 올라왔습니다.")
        
    }
}


// MARK: Coffee 타입(열거형) 정의
enum Coffee: String ,CaseIterable {
    case americano = "아메리카노"
    case espresso = "에스프레소"
    case cafeLatte = "카페라떼"
    case cafeMocha = "카페모카"
    case vanillaLatte = "바닐라라떼"
    case cappuccino = "카푸치노"
    case affogato = "아포가토"
    case caramelMacchiato = "카라멜마끼아또"
    
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .espresso:
            return 3500
        case .cafeLatte:
            return 4500
        case .cafeMocha:
            return 4500
        case .vanillaLatte:
            return 4800
        case .cappuccino:
            return 5000
        case .affogato:
            return 5300
        case .caramelMacchiato:
            return 5500
        }
    }
}


// MARK: 출력

var misterLee = Person(name: "이철수", age: 20, money: 23000)
misterLee.selfIntroduce()
var missKim = Person(name: "김영희", age: 29, money: 34000)
missKim.selfIntroduce()

var yagombucks = CoffeeShop(cafeName: "야곰벅스", barista: misterLee)

print(yagombucks.menu)
yagombucks.selfIntroduce()

missKim.orderingCoffee(coffee: Coffee.caramelMacchiato)
yagombucks.takeOrder(coffee: Coffee.caramelMacchiato)
print(yagombucks.pickUpTable)

