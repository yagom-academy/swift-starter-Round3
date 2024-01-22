//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/9/24.
//

import Foundation

final class CoffeeShop{
    private(set) var storeName: String
    private(set) var address: String
    private(set) var phoneNumber: String
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
    
    func employBarista(barista person: Person) {
        self.barista = person
    }
    
    func fireBarista() {
        self.barista = nil
    }
    
    func acceptOrder(from person: Person, orderList: [Coffee]) {
        var amount: Int = 0
        let name: String = person.fullName
        self.orderTable[name] = orderList
        
        orderList.forEach({
            if let price = self.menus[$0] {
                amount += price
            } else {
                print("메뉴를 확인해주세요.")
            }
        })
        
        self.sales += amount
        
        print("\(name)님의 주문을 받았습니다.")
        print("이번 주문의 결제 금액은 \(amount)원 입니다.")
        print("현재 매장의 매출은 \(self.sales)원 입니다.")
    }
    
    func makeCoffee(from person: Person) {
        let name = person.fullName
        
        if let _ = self.barista {
            pickUpTable[name] = orderTable[name]
            orderTable[name] = nil
            print("\(name)님의 주문이 완료되었습니다. 커피를 가져가주세요.")
        } else {
            print("바리스타가 없어서 커피를 만들 수 없습니다.")
        }
    }
    
    func giveCoffee(from person: Person) -> [Coffee]? {
        let name = person.fullName
        
        guard let coffees: [Coffee] = self.pickUpTable[name] else { return nil }
        self.pickUpTable[name] = nil
        
        return coffees
    }
}
