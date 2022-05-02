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
    
    mutating func buyCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop?) {
        if var cafe = coffeeShop {
            if let price = cafe.order(coffee, by: self){
                money -= price
            }
        } else {
            print("현재 커피숍이 존재하지 않습니다.")
        }
    }
}

struct CoffeeShop {
    let name: String
    var address: String
    var totalIncome = 0
    var menu = [Coffee: Int]()
    var pickUpTable = [String: Coffee]()
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
    
    mutating func order(_ coffee: Coffee, by customer: Person) -> Int? {
        if isEmptyMenu() {
            print("죄송합니다! 현재 오픈 준비 중 입니다!!!!!")
            return nil
        }
        if barista == nil {
            print("현재 출근한 바리스타가 없습니다. 잠시 후에 다시 주문해 주세요.")
            return nil
        }
        if let price = menu[coffee] {
            if customer.isSpendable(price) {
                print("\(coffee)가 주문되었습니다.")
                totalIncome += price
                make(coffee, orderedBy: customer)
                return price
            } else {
                print("잔액이 \(price - customer.money)만큼 부족합니다")
                return nil
            }
        } else {
            print("해당 메뉴는 저희 매장에서 판매하지 않습니다.")
            return nil
        }
        
    }
    
    func isItOnMenu(that coffee: Coffee) -> Bool {
        return menu.contains(where: {$0.key == coffee})
    }
    
    mutating func make(_ coffee: Coffee, orderedBy customer: Person) {
        pickUpTable.updateValue(coffee, forKey: customer.name)
        print("\(customer.name)님이 주문하신 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요")
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

yagombucks?.updateMenuUsing(coffee: Coffee.americano, price: 3500)
yagombucks?.updateMenuUsing(coffee: Coffee.cafeLatte, price: 4800)
yagombucks?.updateMenuUsing(coffee: Coffee.coldBrew, price: 5500)
yagombucks?.updateMenuUsing(coffee: Coffee.espresso, price: 3000)
yagombucks?.updateMenuUsing(coffee: Coffee.earlGrey, price: 4500)
yagombucks?.barista = misterLee

missKim?.buyCoffee(Coffee.americano, at: yagombucks)
missKim?.saveMoney(amount: 10000)
missKim?.buyCoffee(Coffee.coldBrew, at: yagombucks)
