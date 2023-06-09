//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Tony Lim on 2023/06/09.
//

import Foundation

class CoffeeShop {
    private var name: String
    private var sales: Int
    private(set) var menu: [Coffee: Int]
    private var barista: [Person]
    
    init(name: String, sales: Int = 0, menu: [Coffee : Int], barista: Person...) {
        self.name = name
        self.sales = sales
        self.menu = menu
        
        self.barista = [Person]()
        for person in barista {
            self.barista.append(person)
        }
    }
    
    func showMenu() {
        print("- - - - Menu - - - -")
        for (coffee, price) in menu {
            print("\(coffee.name) : \(price)원")
        }
        print("- - - - - - - - - - -")
    }
    
    func order(by person: Person, for menu: [Coffee]) {
        let sales = calculateMoney(menu)
        getMoney(sales)
        
        let orderedMenu = make(menu)
        pickUpTable(to: person, orderedMenu)
    }
    
    func calculateMoney(_ order: [Coffee]) -> Int {
        var pay = 0
        for item in order {
            pay += menu[item] ?? 0
        }
        return pay
    }
    
    func getMoney(_ money: Int) {
        self.sales += money
    }
    
    func make(_ menu: [Coffee]) -> [Coffee] {
        var madeMenu = [Coffee]()
        
        for order in menu {
            madeMenu.append(order)
            print("\(order.name) 제품을 만드는 중입니다.")
            sleep(1)
        }
        
        return madeMenu
    }
    
    func pickUpTable(to person: Person, _ menu: [Coffee]) {
        var menuString = ""
        
        for item in menu {
            menuString += "\(item.name), "
        }
        menuString.removeLast(2) // 마지막 , 를 지우기 위함.
        
        let sendingMessage = "\(person.name) 고객님. 주문하신 \(menuString) 나왔습니다."
        print(sendingMessage)
        
        person.take(menu)
    }
    
    
}
