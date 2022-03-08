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
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, at: CoffeeShop) {
        print("\(self.name)(이)가 \(at.name)에서 \(coffee.name)를 구입합니다.")
        at.takeOrder(coffee, from: self)
    }
    
    func pay(for menuName: Coffee, at coffeeshop: CoffeeShop) -> Bool {
        
        guard let coffeePrice = coffeeshop.menu[menuName] else {
            return false
        }
        
        if coffeePrice < self.money {
            print("\(self.name)(이)가 \(coffeeshop.name)에서 \(menuName.name)를 주문했습니다.")
            self.money = self.money - coffeePrice
            print("소요 비용은 \(coffeePrice)원이며, 잔액은 \(self.money)원 입니다.")
            return true
        } else {
            print("구입할 수 없습니다.")
            print("잔액이 \(coffeePrice - self.money)원 부족합니다.")
            return false
        }
    }
}

class CoffeeShop {
    var name: String
    var salesRevenue: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: Array<(Date, Person, Coffee, Person)> = []
    var freeBaristas: Array<Person> = []
    var busyBaristas: Array<Person> = []
    var orderQueue: Array<(Date, Person, Coffee, Person)> = []
    var completedOrderQueue: Array<(Date, Person, Coffee, Person)> = []
    
    init(name: String, baristas: Array<Person>, menu: [Coffee: Int]) {
        self.name = name
        self.freeBaristas = baristas
        self.menu = menu
    }
    
    func takeOrder(_ coffee: Coffee, from client: Person) {
        
        if client.pay(for: coffee, at: self) == true {
            
            if let payedMoney = self.menu[coffee]{
                self.salesRevenue += payedMoney
            }
            
            let orderInfo = (orderTime: Date(), client: client, order: coffee, barista: self.freeBaristas.removeFirst())
            
            print("\(self.name): \(orderInfo.client.name)님의 \(orderInfo.order.name) 주문 접수가 완료되었습니다.")
            print("바리스타 \(orderInfo.barista.name)님이 맛있게 만들어드릴 겁니다.")
            print("(주문 timestamp: \(orderInfo.orderTime))")
            
            busyBaristas.append(orderInfo.barista)
            orderQueue.append(orderInfo)
            
            make(orderInfo)
        } else {
            print("\(self.name): 결제가 안 되네요...")
        }
    } 
    
    
    func make(_ orderInfo: (orderTime: Date, client: Person, order: Coffee, barista: Person)) {

        completedOrderQueue.append(orderInfo)

        putOnTable(orderInfo)
    }
    
    func putOnTable(_ completedOrderInfo: (orderTime: Date, client: Person, order: Coffee, barista: Person)) {
        
        orderQueue.removeFirst()
        freeBaristas.append(busyBaristas.removeFirst())
        
        print("\(completedOrderInfo.barista.name) 바리스타가 만든 \(completedOrderInfo.client.name)님의 \(completedOrderInfo.order.name)가 준비되었습니다. 픽업대에서 가져가주세요.")
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
