//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by Dawn on 2023/03/13.
//

//import Foundation
//
//class Person {
//    var money: Int
//    var name: String
//    
//    init(money: Int, name: String) {
//        self.money = money
//        self.name = name
//    }
//    
//    func order(coffee: Coffee, at coffeShop: CoffeeShop) {
//        self.money = coffeShop.takeOrder(coffee, payout: money)
//    }
//}
//
//enum Coffee {
//    case americano, cafeLatte, vanillaLatte
//}
//
//class CoffeeShop {
//    var sales: Int = 0
//    var pickUpTable: [Coffee] = [Coffee]()
//    var barista: Person
//    var menu: [Coffee: Int]
//    
//    init(barista: Person, menu: [Coffee: Int]) {
//        self.barista = barista
//        self.menu = menu
//    }
//    
//    func takeOrder(_ coffee: Coffee, payout: Int) -> Int {
//        if let orderPrice = menu[coffee] {
//            if payout - orderPrice >= 0 {
//                print("\(coffee)를 선택하셨습니다.")
//                sales += orderPrice
//                makeCoffee(coffee)
//                return payout - orderPrice
//            } else {
//                print("\(orderPrice - payout)원이 부족합니다.")
//                return payout
//            }
//        } else {
//            print("선택하신 커피가 존재하지 않습니다.")
//            return payout
//        }
//    }
//    
//    func makeCoffee(_ coffee: Coffee) {
//        pickUpTable.append(coffee)
//        print("주문하신 \(coffee)나왔습니다.")
//    }
//}
//
//let misterLee: Person = Person(money: 3000, name: "Lee")
//let missKim: Person = Person(money: 10000, name: "Kim")
//
//let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, menu: [Coffee.americano: 4500,
//                                                                   Coffee.cafeLatte: 5000,
//                                                                   Coffee.vanillaLatte: 5500])

