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
    
    func buyingCoffee(coffee: Coffee.RawValue) {
        print("\(coffee)를 주문합니다.")
    }
}

// MARK: CoffeeShop 타입 정의
struct CoffeeShop {
    let cafeName: String
    var revenue: Int
    var menu: Dictionary<Coffee.RawValue, Int> =
    [Coffee.americano.rawValue : 4000, Coffee.espresso.rawValue : 3500, Coffee.cafeLatte.rawValue : 4500,
     Coffee.cafeMocha.rawValue : 4500, Coffee.vanillaLatte.rawValue : 4800, Coffee.cappuccino.rawValue : 5000,
     Coffee.affogato.rawValue : 5300, Coffee.caramelMacchiato.rawValue : 5500]
    var pickUpTable: Array<Coffee.RawValue>
    var barista: Person?
    
    func selfIntroduce() {
        if let barista = barista {
            print("어서오세요 \(cafeName)입니다. 바리스타 \(barista.name)라고 합니다. \n \(cafeName)의 메뉴는 \(menu)입니다. \n픽업테이블에 있는 주문하신 음료를 찾아가시기 바랍니다. \n\(pickUpTable)")
        } else {
            print("어서오세요 \(cafeName)입니다. \n \(cafeName)의 메뉴는 \(menu)입니다. \n픽업테이블에 있는 주문하신 음료를 찾아가시기 바랍니다. \n\(pickUpTable)")
        }
    }
    
    mutating func takeOrder(coffee: Coffee.RawValue){
        print("\(cafeName)에서 \(coffee)를 주문받았습니다.")
        makeCoffee(coffee: coffee)
    }
    
    mutating func makeCoffee(coffee: Coffee.RawValue) {
        print("\(cafeName)에서 \(coffee)를 만들었습니다.")
        pickUpTable.append(coffee)
        print("주문하신음료 \(coffee)가 \(cafeName)의 픽업테이블에 올라왔습니다.")
        
    }
    
}
// MARK: Coffee 타입(열거형) 정의
enum Coffee: String {
    case americano = "아메리카노"
    case espresso = "에스프레소"
    case cafeLatte = "카페라떼"
    case cafeMocha = "카페모카"
    case vanillaLatte = "바닐라라떼"
    case cappuccino = "카푸치노"
    case affogato = "아포가토"
    case caramelMacchiato = "카라멜마끼아또"
}


// MARK: 출력

var misterLee: Person = Person(name: "이철수", age: 20, money: 23000)
misterLee.selfIntroduce()
var missKim: Person = Person(name: "김영희", age: 29, money: 34000)
missKim.selfIntroduce()

var yagombucks: CoffeeShop = CoffeeShop(cafeName: "야곰벅스", revenue: 0, pickUpTable: [], barista: misterLee)
yagombucks.selfIntroduce()

missKim.buyingCoffee(coffee: "카라멜마끼아또")
yagombucks.takeOrder(coffee: "카라멜마끼아또")
print(yagombucks.pickUpTable)

