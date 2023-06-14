//
//  Persons.swift
//  CodeStarterCamp_Week3
//
//  Created by Jack Lee on 2023/06/13.
//

import Foundation

class Person {
    private var name: String
    private var money: Int
    private var gender: Gender
    private var coffeeChoice: [CoffeeShop.Coffee: Int]
    fileprivate var store: CoffeeShop
    
    init(name: String, money: Int, gender: Gender, coffeeChoice: [CoffeeShop.Coffee: Int] = [:], store: CoffeeShop) {
        self.name = name
        self.money = money
        self.gender = gender
        self.coffeeChoice = coffeeChoice
        self.store = store
    }
    
    enum Gender {
        case male, female
    }
    
    func checkCash() -> Int {
        return self.money
    }
    
    // 원하는 커피 선택
    func selectCoffee(chose coffee: CoffeeShop.Coffee, for amount: Int) {
        print("오늘은 \(coffee)가 마시고 싶네? \(amount)잔 시켜야겠다.")
        coffeeChoice.updateValue(amount, forKey: coffee)
    }
    
    // 판매 비용 확인
    func checkPrice() -> Int {
        var totalCost = 0
        for (coffee, amount) in coffeeChoice {
            totalCost += coffee.price * amount
        }
        return totalCost
    }
    
    // 구매 가능 여부 확인
    func approachCashier() -> Bool {
        guard money >= checkPrice() else {
            print("\(checkPrice() - money)원 밖에 없네... 다시 고르자")
            return false
        }
        print("구매 가능하다! 주문해야지~")
        return true
    }
    
    // 커피 주문
    func orderCoffee() {
        if approachCashier() {
            for (coffee, amount) in coffeeChoice {
                print("\(coffee), \(amount)잔 주문할게요. \(self.name)으로 불러주세요.")
                store.makeCoffee(coffee, for: self)
                self.money -= coffee.price
            }
        }
    }
    
    // OlderPerson 클래스로 매장 이름 알리기
    func isStore() -> CoffeeShop {
        return store
    }
    
    // CoffeeShop 매장에게 이름 알리기
    func isName() -> String {
        return self.name
    }
}

// 커피가 아닌 수프를 좋아하는 할머니
class OlderPerson: Person {
    private var soupChoice: [CoffeeShop.Soup: Int]
    
    init(name: String, money: Int, gender: Gender, store: CoffeeShop, soupChoice: [CoffeeShop.Soup: Int] = [:]) {
        self.soupChoice = soupChoice
        super.init(name: name, money: money, gender: gender, store: store)
    }
    
    func selectSoup(chose kind: CoffeeShop.Soup) {
        soupChoice.updateValue(1, forKey: kind)
    }
    
    override func checkPrice() -> Int {
        var totalCost = 0
        for (soup, amount) in soupChoice {
            totalCost += soup.price * amount
        }
        return totalCost
    }
    
    func orderSoup() {
        if approachCashier() {
            var myWallet = checkCash()
            for (soup, amount) in soupChoice {
                store.heatSoup(soup, for: self)
                myWallet -= soup.price * amount
            }
        }
    }
}
