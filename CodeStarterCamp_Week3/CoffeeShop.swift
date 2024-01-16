//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/9/24.
//

import Foundation

final class CoffeeShop{
    private var storeName: String
    private var address: String
    private var phoneNumber: String
    private var sales: Int
    private var orderTable: [String: [Coffee]]
    private var pickUpTable: [String: [Coffee]]
    private var menus: [Coffee: Int]
    private var barista: Person? = nil
    
    init(storeName: String, address: String, phoneNumber: String, sales: Int, orderTable: [String : [Coffee]], pickUpTable: [String : [Coffee]], menus: [Coffee : Int]) {
        self.storeName = storeName
        self.address = address
        self.phoneNumber = phoneNumber
        self.sales = sales
        self.orderTable = orderTable
        self.pickUpTable = pickUpTable
        self.menus = menus
    }
    
    func name() -> String {
        return self.storeName
    }
    
    func employBarista(barista person: Person) {
        self.barista = person
    }
    
    func fireBarista() {
        self.barista = nil
    }
    
    func acceptOrder(from person: Person, orderList: [Coffee]) {
        let name: String = person.name()
        self.orderTable[name] = orderList
        
        print("\(name)님의 주문을 받았습니다.")
        orderList.forEach({ self.sales += self.menus[$0] ?? 0 })
        print("현재 매장의 매출은 \(self.sales)원 입니다.")
    }
    
    func makeCoffee(from person: Person) {
        let name = person.name()
        
        if let _ = self.barista {
            pickUpTable[name] = orderTable[name]
            orderTable[name] = nil
            print("\(name)님의 주문이 완료되었습니다. 커피를 가져가주세요.")
        } else {
            print("바리스타가 없어서 커피를 만들 수 없습니다.")
        }
    }
    
    func giveCoffee(from person: Person) -> [Coffee]? {
        let name = person.name()
        
        guard let coffees: [Coffee] = self.pickUpTable[name] else {
            print("\(name)님의 주문이 완료되지 않았습니다.")
            return nil
        }
        
        self.pickUpTable[name] = nil
        
        return coffees
    }
}
