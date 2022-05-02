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
    
    func greet() -> String {
        return "안녕하세요!!!"
    }
    
    func introduce() -> String {
        return "저의 이름은 \(name)입니다. 저는 \(age)살이고 키는 \(height)cm 몸무게는 \(weight)kg 입니다."
    }
    
    mutating func addOneToAge() {
        age += 1
    }
    
    mutating func spendMoney(amount: Int) {
        if !isSpendable(amount) {
            print("잔액이 부족합니다.")
        } else {
            money -= amount
        }
    }
    
    func isSpendable(_ amount: Int) -> Bool {
        if money < amount {
            return false
        } else {
            return true
        }
    }
    
    mutating func saveMoney(amount: Int) {
        money += amount
    }
    
    func buyCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop?) -> (Int?, String)  {
        if let cafe = coffeeShop {
            if let price = cafe.menu[coffee] {
                return (price, "구매를 하였습니다.")
            } else {
                return (nil, "메뉴판을 다시 확인하세요.")
            }
        } else {
            return (nil, "현재 커피숍이 존재하지 않습니다.")
        }
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
    var totalIncome = 0
    var menu = [Coffee: Int]()
    var pickUpTable: Coffee?
    var barista: Person?
    
    init?(name: String, address: String) {
        if name.isEmpty || address.isEmpty {
            return nil
        }
        self.name = name
        self.address = address
    }
    
    func greetToCustomer() -> String {
        return "어서오세요!! \(name)입니다!!"
    }
    
    func introduceCoffeShop() -> String {
        return "저희 \(name)는(은) \(address)에 위치한 카페입니다!!!"
    }
    
    func introduceMenu() -> String {
        var menuContents = "\(name) 메뉴판\n"
        if isEmptyMenu() {
            return "죄송합니다! 현재 오픈 준비 중 입니다!!!!!"
        } else {
            for (coffee, price) in menu {
                menuContents += "\(coffee) : \(price)원\n"
            }
        }
        return menuContents
    }
    
    func isEmptyMenu() -> Bool {
        return menu.isEmpty
    }
    
    func order(_ coffee: Coffee) {
        if isEmptyMenu() {
            print("죄송합니다! 현재 오픈 준비 중 입니다!!!!!")
        } else if isItOnMenu(that: coffee) {
            print("\(coffee) 주문이 접수되었습니다.")
        } else {
            print("죄송합니다. 주문하신 메뉴는 저희 가게에서 판매하지 않습니다.")
        }
    }
    
    func isItOnMenu(that coffee: Coffee) -> Bool {
        return menu.contains(where: {$0.key == coffee})
    }
    
    func makeCoffee(_ coffee: Coffee) {
        if barista != nil {
            print("주문하신 \(coffee)가 준비되었습니다.")
        } else {
            print("죄송합니다. 현재 바리스타가 출근하지 않았습니다.")
        }
    }
    
    mutating func updateMenuUsing(coffee: Coffee, price: Int) {
        if let oldPrice = menu.updateValue(price, forKey: coffee){
            print("\(coffee)의 가격이 \(oldPrice)에서 \(price)로 변경되었습니다.")
        } else {
            print("가격이 \(price)인 \(coffee)가 추가되었습니다.")
        }
    }
}

var misterLee = Person(name: "이병현", age: 23, gender: Gender.men, height: 183, weight: 84)
var missKim = Person(name: "김태희", age: 21, gender: Gender.women, height: 168, weight: 48)
var yagombucks = CoffeeShop(name: "Yagom Bucks", address: "서울시 강남구 강남대로 390")
yagombucks?.barista = misterLee
