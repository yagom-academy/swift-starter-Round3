//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Gender: String {
    case men = "남자"
    case women = "여자"
}

enum Coffe: String {
    case americano, espresso, cafeLatte, coldBrew, milkTea, lomonAde, earlGrey
}

struct Person {
    let name: String
    var age: Int
    let gender: Gender
    var hight: Int
    var weight: Int
    var money: Int = 0
    
    mutating func greet() -> String {
        return "안녕하세요!!!"
    }
    mutating func introduce() -> String {
        return "저의 이름은 \(self.name)입니다. 저는 \(self.age)살이고 키는 \(self.hight)cm 몸무게는 \(self.weight)kg 입니다."
    }
    mutating func addOneToAge() {
        self.age += 1
    }
    mutating func calculateMoney(by amount: Int, sign: Int) -> Bool {
        if sign == -1 {
            if self.money < amount { return false }
            self.money -= amount
        } else {
            self.money += amount
        }
        return true
    }
    
    init?(name: String, age: Int, gender: Gender, hight: Int, weight: Int) {
        if name.isEmpty || !(0...120).contains(age) || hight <= 0 || weight <= 0 {
            return nil
        }
        self.name = name
        self.age = age
        self.gender = gender
        self.hight = hight
        self.weight = weight
    }
}

struct CoffeShop {
    let cafeName: String
    var adress: String
    var sales = 0
    var menu: [Coffe: Int]
    var pickUpTable: Coffe?
    var barista: Person?
    
    mutating func greetToCustomer() -> String {
        return "어서오세요!! \(cafeName)입니다!!"
    }
    mutating func introduceCoffeShop() -> String {
        return "저희 \(cafeName)는(은) \(adress)에 위치한 카페입니다!!!"
    }
    mutating func introduceMenu() -> String {
        var menuContents = "\(cafeName)는(은)의 메뉴판\n"
        if !menu.isEmpty {
            for (coffe, price) in self.menu {
                menuContents += "\(coffe.rawValue) : \(price)원\n"
            }
        } else {
            menuContents = "죄송합니다! 현재 오픈 준비중 입니다."
        }
        return menuContents
    }
    mutating func takeAnOrder(_ coffe: Coffe) {
        if let _ = menu[coffe] {
            print("\(coffe)이 주문이 접수되었습니다.")
        } else {
            print("죄송합니다. 주문하신 메뉴는 저희 가게에서 판매하지 않습니다.")
        }
    }
    mutating func makeCoffe(_ coffe: Coffe) {
        if let _ = self.barista {
            print("주문하신 \(coffe)가 준비되었습니다.")
        } else {
            print("죄송합니다. 현재 바리스타가 출근하지 않았습니다.")
        }
    }
    mutating func upsertCoffe(coffe: Coffe, price: Int) {
        if let oldprice = self.menu.updateValue(price, forKey: coffe){
            print("\(coffe)의 가격이 \(oldprice)에서 \(price)로 변경되었습니다.")
        } else {
            print("가격이 \(price)인 \(coffe)가 추가되었습니다.")
        }
    }
    
    init?(cafeName: String, adress: String) {
        self.cafeName = cafeName
        self.adress = adress
        menu = [Coffe: Int]()
    }
}

var misterLee = Person(name: "이병현", age: 23, gender: Gender.men, hight: 183, weight: 84)
var missKim = Person(name: "김태희", age: 21, gender: Gender.women, hight: 168, weight: 48)
var yagombuks = CoffeShop(cafeName: "Yagom Bucks", adress: "서울시 강남구 강남대로 390")
