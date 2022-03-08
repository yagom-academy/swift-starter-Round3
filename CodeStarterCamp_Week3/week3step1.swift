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
    
    func pay(for menuName: Coffee, at coffeeshop: CoffeeShop) {
        
        guard let coffeePrice = coffeeshop.menu[menuName] else {
            print("\(coffeeshop.name)에 \(menuName) 메뉴는 없습니다.")
            return
        }
        
        if coffeePrice < self.money {
            print("\(coffeeshop.name)에서 \(menuName)을/를 주문했습니다.")
            print("소요 비용은 \(coffeePrice)원이며, 잔액은 \(self.money - coffeePrice)원 입니다.")
            self.money = self.money - coffeePrice
            
            coffeeshop.takeOrder(menuName, from: self)
            
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
    var freeBaristas: Array<Person> = []
    var busyBaristas: Array<Person> = []
    var orderQueue: Array<(Date, Person, Coffee, Person, Bool)> = []

    //var orderQueue: [orderInfo]
    
    init(name: String, baristas: Array<Person>, menu: [Coffee: Int]) {
        self.name = name
        self.freeBaristas = baristas
        self.menu = menu
    }
    
    func takeOrder(_ coffee: Coffee, from client: Person) {

        let orderInfo = (orderTime: Date(), client: client, order: coffee, barista: self.freeBaristas.removeFirst(), isReady: false)
        
        print("\(orderInfo.client.name)님의 \(orderInfo.order) 주문 접수가 완료되었습니다.")
        print("바리스타 \(orderInfo.barista.name)님이 맛있게 만들어드릴 겁니다.")
        print("(주문 timestamp: \(orderInfo.orderTime))")
        
        busyBaristas.append(orderInfo.barista)
        orderQueue.append(orderInfo)
        
        make(orderInfo)
        
    } 
    
    
    func make(_ orderInfo: (orderTime: Date, client: Person, order: Coffee, barista: Person, isReady: Bool)) {

        var completedOrderInfo = orderInfo
        completedOrderInfo.isReady = true
        
        orderQueue.removeFirst()
        
        freeBaristas.append(busyBaristas.removeFirst())
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
