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
    private var menu: [Coffee: Int]
    
    init(name: String, sales: Int, menu: [Coffee : Int]) {
        self.name = name
        self.sales = sales
        self.menu = menu
    }
    
    func showMenu() {
        print("- - - - Menu - - - -")
        for (coffee, price) in menu.enumerated() {
            print("\(coffee) : \(price)원")
        }
        print("- - - - - - - - - - -")
    }
    
    func order(by person: String, for menu: [Coffee]) {
        let orderedMenu = make(menu)
        
    }
    
    func make(_ menu: [Coffee]) -> [Coffee] {
        var madeMenu = [Coffee]()
        
        for order in menu {
            madeMenu.append(order)
            sleep(1)
        }
        
        return madeMenu
    }
    
    func pickUpTable(for order: String, _ menu: [Coffee: Int]) -> [Coffee] {
        var menuString = ""
        var madeMenu = [Coffee]()
        
        for (order, each) in menu {
            menuString += "\(order.menuName) \(each)잔"
            menuString += ","
        }
        menuString.removeLast() // 마지막 , 를 지우기 위함.
        
        let sendingMessage = "\(order) 고객님. 주문하신 \(menuString) 나왔습니다."
        print(sendingMessage)
        
        return madeMenu
    }
    
    
}
