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

enum Coffee: String {
    case americano, espresso, cafeLatte, coldBrew, milkTea, lemonAde, earlGrey
}

struct Person {
    let name: String
    var age: Int
    let gender: Gender
    var height: Int
    var weight: Int
    var money: Int = 0
    
    mutating func greet() -> String {
        return "안녕하세요!!!"
    }
    
    mutating func introduce() -> String {
        return "저의 이름은 \(self.name)입니다. 저는 \(self.age)살이고 키는 \(self.height)cm 몸무게는 \(self.weight)kg 입니다."
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
    
    init?(name: String, age: Int, gender: Gender, height: Int, weight: Int) {
        if name.isEmpty || !(0...120).contains(age) || height <= 0 || weight <= 0 {
            return nil
        }
        self.name = name
        self.age = age
        self.gender = gender
        self.height = height
        self.weight = weight
    }
}

struct CoffeeShop {
    let name: String
    var address: String
    var sales = 0
    var menu: [Coffee: Int]
    var pickUpTable: Coffee?
    var barista: Person?
    
    mutating func greetToCustomer() -> String {
        return "어서오세요!! \(self.name)입니다!!"
    }
    
    mutating func introduceCoffeShop() -> String {
        return "저희 \(self.name)는(은) \(self.address)에 위치한 카페입니다!!!"
    }
    
    mutating func introduceMenu() -> String {
        var menuContents = "\(self.name) 메뉴판\n"
        if !self.menu.isEmpty {
            for (coffee, price) in self.menu {
                menuContents += "\(coffee.rawValue) : \(price)원\n"
            }
        } else {
            menuContents = "죄송합니다! 현재 오픈 준비중 입니다."
        }
        return menuContents
    }
    
    mutating func order(_ coffee: Coffee) {
        if let _ = menu[coffee] {
            print("\(coffee)이 주문이 접수되었습니다.")
        } else {
            print("죄송합니다. 주문하신 메뉴는 저희 가게에서 판매하지 않습니다.")
        }
    }
    
    mutating func makeCoffee(_ coffee: Coffee) {
        if let _ = self.barista {
            print("주문하신 \(coffee)가 준비되었습니다.")
        } else {
            print("죄송합니다. 현재 바리스타가 출근하지 않았습니다.")
        }
    }
    
    mutating func upsertCoffee(coffee: Coffee, price: Int) {
        if let oldPrice = self.menu.updateValue(price, forKey: coffee){
            print("\(coffee)의 가격이 \(oldPrice)에서 \(price)로 변경되었습니다.")
        } else {
            print("가격이 \(price)인 \(coffee)가 추가되었습니다.")
        }
    }
    
    init?(name: String, address: String) {
        if name.isEmpty || address.isEmpty {
            return nil
        }
        self.name = name
        self.address = address
        menu = [Coffee: Int]()
    }
}

var misterLee = Person(name: "이병현", age: 23, gender: Gender.men, height: 183, weight: 84)
var missKim = Person(name: "김태희", age: 21, gender: Gender.women, height: 168, weight: 48)
var yagombucks = CoffeeShop(name: "Yagom Bucks", address: "서울시 강남구 강남대로 390")
yagombucks?.barista = misterLee

