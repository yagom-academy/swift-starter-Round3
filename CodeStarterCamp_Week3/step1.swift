//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by smfc on 6/7/2022.
//

//import Foundation
//
//struct Person {
//    var name: String
//    var age: Int
//    var height: Double?
//    var moneyAmount: Int
//
//    mutating func buyCoffee(spend cost: Int) {
//        if moneyAmount >= cost {
//            print("커피를 \(cost)원에 구입합니다, ", terminator: "")
//            self.moneyAmount = moneyAmount - cost
//            print("남은 돈: \(self.moneyAmount)원")
//        }
//        else {
//            print("가진 돈이 커피 값보다 적습니다! 가진 돈: \(moneyAmount)원")
//        }
//    }
//}
//
//var misterLee: Person = Person(name: "misterLee", age: 20, height: 176.8, moneyAmount: 10000)
//var missKim: Person = Person(name: "missKim", age: 24, moneyAmount: 4500)
//
//struct CoffeeShop {
//    var name: String
//    enum Coffee: String {
//        case espresso = "에스프레소",
//             americano = "아메리카노",
//             latte = "라떼",
//             cappuccino = "카푸치노",
//             mocha = "모카",
//             todaysCoffee = "오늘의 커피"
//    }
//    var barista: Person?
//    var salesAmount: Int
//    var menu: [Coffee: Int] = [Coffee.espresso: 3800, Coffee.americano: 4200, Coffee.latte: 4500, Coffee.cappuccino: 5100, Coffee.mocha: 5600, Coffee.todaysCoffee: 4600]
//    var pickUpTable: Array<String> = []
//
//    func takeOrder(_ coffee: Coffee) {
//        print("\(coffee.rawValue) 주문을 받았습니다.")
//    }
//
//    mutating func makeCoffee(of coffee: Coffee) {
//        takeOrder(coffee)
//        print("\(coffee.rawValue) 커피를 만듭니다.")
//        pickUpTable.append("\(coffee)")
//        print("\(coffee.rawValue) 픽업 대기중입니다.")
//    }
//}
//
//var yagombucks: CoffeeShop = CoffeeShop(name: "yagomBucks", barista: misterLee, salesAmount: 10000000)
