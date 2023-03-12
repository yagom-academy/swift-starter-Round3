//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by suyeon park on 2023/03/10.
//

import Foundation

class CoffeeShop {
    var salesRevenue: Int
    var menus: [Menu]
    var pickUpTable: [Coffee] {
        didSet {
            print("모든 음료의 제조가 완료되었습니다. 픽업 부탁드립니다:)")
        }
    }
    var barista: Person? = nil {
        didSet (newValue) {
            if newValue != nil {
                print("새로운 바리스타가 등장하였습니다!")
            }
        }
    }
    
    init(menus: [Menu], salesRevenue: Int = 0, pickUpTable: [Coffee] = []) {
        print("카페가 생겼어요!!!")
        self.salesRevenue = salesRevenue
        self.menus = menus
        self.pickUpTable = pickUpTable
    }
    
    struct Menu {
        var coffee: Coffee
        var price: Int
    }
    
    func canOrder(_ coffees: [Coffee]) -> Bool {
        
        var canOrder = true
        
        if barista == nil {
            print("현재 주문을 받을 수 있는 바리스타가 없어요ㅠㅠ")
            canOrder = false
        }
        
        if coffees.count == 0 {
            print("받은 주문이 없어요ㅠㅠ")
            canOrder = false
        }
        
        for coffee in coffees {
            let menuOrNil = menus.filter({ $0.coffee == coffee }).first
            
            guard menuOrNil != nil else {
                canOrder = false
                break
            }
        }
        
        return canOrder
    }
    
    func make(_ coffees: [Coffee], for name: String) {
        print("\(getOrderListFormat(coffees: coffees)) 주문 받았습니다.")
        
        let totalPrice = getTotalPrice(coffees: coffees)
        print("총 \(totalPrice)원 입니다.")
        salesRevenue = salesRevenue + totalPrice
        provideCoffee(coffees: coffees, for: name)
    }
    
    func getTotalPrice(coffees: [Coffee]) -> Int {
        var price = 0
        
        for coffee in coffees {
            let menu = menus.filter({ $0.coffee == coffee }).first
            price = price + (menu?.price ?? 0)
        }
        
        return price
    }
    
    private func provideCoffee(coffees: [Coffee], for name: String) {
        print("\(name) 님이 주문하신 \(getOrderListFormat(coffees: coffees)) (이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        
        pickUpTable = pickUpTable + coffees
    }
    
    private func getOrderListFormat(coffees: [Coffee]) -> String {
        return coffees.map{String($0.rawValue)}.joined(separator: ", ")
    }
}
