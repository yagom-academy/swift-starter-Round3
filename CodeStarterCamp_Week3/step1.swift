////
////  step1.swift
////  CodeStarterCamp_Week3
////
////  Created by 한서영 on 2022/07/06.
////
//
//import Foundation
//
//enum Coffee: String {
//    case latte, mocha, coldBrew, espresso, americano, cappuccino
//}
//
//class Person {
//    enum Gender {
//        case woman, man
//    }
//
//    var name: String
//    private var age: Int
//    var money: Int
//    var nationality: String
//    var gender: Gender
//
//    init(name: String, age: Int, money: Int, nationality: String, gender: Gender) {
//        self.name = name
//        self.age = age
//        self.money = money
//        self.nationality = nationality
//        self.gender = gender
//    }
//
//    func getOld() {
//        self.age += 1
//        print("현재 나이는 \(self.age)입니다.")
//    }
//
//    func buyCoffee(coffeePrice: Int) {
//        if self.money >= coffeePrice {
//            self.money -= coffeePrice
//                print("\(coffeePrice)원 커피를 구매하였습니다.\n잔액은 \(self.money)입니다.")
//        } else {
//            print("잔액 부족. 커피를 살 수 없습니다.")
//        }
//    }
//}
//
//class CoffeeShop {
//    var salesAmount: Int = 0
//    var menu: Dictionary<Coffee, Int> = [Coffee.americano: 4500, Coffee.cappuccino: 5000, Coffee.coldBrew: 5500, Coffee.espresso: 4000, Coffee.latte: 5000, Coffee.mocha: 5300]
//    var pickUpTable: Array<Coffee> = []
//    var barista: Person
//
//    init(barista: Person) {
//        self.barista = barista
//    }
//
//    func getOrder(orderedMenus: Coffee...) {
//        for orderedMenu in orderedMenus {
//            if let coffeePrice: Int = menu[orderedMenu]{
//                self.salesAmount += coffeePrice
//                makeCoffee(orderedMenu: orderedMenu)
//            } else {
//                print("해당 메뉴는 판매하지 않습니다.")
//            }
//        }
//        print("현재 매출액 \(self.salesAmount)")
//    }
//
//    func makeCoffee(orderedMenu: Coffee) {
//        print("\(orderedMenu)가 만들어 졌습니다.")
//        self.pickUpTable.append(orderedMenu)
//    }
//
//    func changeMenuPrice(of name: Coffee, to newPrice: Int) {
//        if let price: Int = self.menu[name] {
//            self.menu[name] = newPrice
//            print("\(name.rawValue)를 \(price)원 으로 변경했습니다")
//        } else {
//            print("해당 메뉴는 판매하지 않습니다.")
//        }
//    }
//}
