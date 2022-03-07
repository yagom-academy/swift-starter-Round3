//
//  Step 1.swift
//  CodeStarterCamp_Week3
//
//  Created by Minseong Kang on 2022/03/01.
//

import Foundation

class Person {
    var name: String
    var money: Int
    var inventory: Array<String> = []
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, at: CoffeeShop) {
        print("\(self.name)이/가 \(at.name)에서 \(coffee)를 구입합니다.")
        at.takeOrder(coffee, from: self)
    }
    
    func pay(forWhat: Coffee, at: CoffeeShop) {
        
        guard let coffeePrice = at.menu[forWhat] else {
            print("\(at.name)에 \(forWhat)라는 메뉴는 없습니다.")
            return
        }
        
        if coffeePrice < self.money {
            print("\(at.name)에서 \(forWhat)을/를 주문했습니다.")
            print("소요 비용은 \(coffeePrice)원이며, 잔액은 \(self.money - coffeePrice)원 입니다.")
            self.money = self.money - coffeePrice
            
            at.takeOrder(forWhat, from: self)
            
        } else {
            print("구입할 수 없습니다.")
            print("잔액이 \(coffeePrice - self.money)원 부족합니다.")
        }
    }
}

class CoffeeShop {
    var name: String
    var salesRevenue: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: Array<String> = []
    var baristas: Array<Person> = []
    
    init(name: String, baristas: Array<Person>, menu: [Coffee: Int]) {
        self.name = name
        self.baristas = baristas
        self.menu = menu
    }
    
    func takeOrder(_ coffee: Coffee, from: Person) {
        print("\(from.name)님의 \(coffee) 주문 접수가 완료되었습니다.")
    }
    
    func make(_ beverage: Coffee) {
        pickUpTable.append("\(beverage)")
        print("주문하신 \(beverage) 나왔습니다.")
    }
}

enum Coffee {
    case espresso
    case americano
    case latte
    case cappuccino
    
    var name: String {
        return "\(self)".capitalized
    }
}
// <비비 피드백 기록용 코멘트>
// var coffee = "\(Coffee.espresso)".capitalized
// "\(self)".capitalized 과 같다. 셀프가 에스프레소로 할당된 경우임
