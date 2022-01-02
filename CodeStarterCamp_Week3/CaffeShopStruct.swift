//
//  CaffeShopStruct.swift
//  CodeStarterCamp_Week3
//
//  Created by 김동욱 on 2021/12/31.
//

import Foundation

enum CoffeeList {
    case americano, latte, espresso
}

struct CoffeeShop {
    
    var barista : Person
    var dailySales : Int = 0
    var coffeeMenu : [CoffeeList : Int] = [CoffeeList.espresso : 1000, CoffeeList.americano : 1500, CoffeeList.latte : 2000]
    var pickUpTable : [Int : String] = [:]
    var orderedCoffee : String = ""
    var orderNumber : Int = 0

    mutating func takeOrderTo(coffee : CoffeeList){
        guard let orderPrice = coffeeMenu[coffee] else { return }
        dailySales += orderPrice
        orderedCoffee = "\(coffee)"
        orderNumber += 1
        print("직원: 안녕하세요 손님 주문 하시겠습니까?")
        print("손님: \(coffee) 로 주세요")
        print("직원: 네 주문하신 커피는 \(coffee) 이며 금액은 \(orderPrice) 원 입니다")
    }
    
    mutating func moveToPickUpTable(coffee : CoffeeList){
        pickUpTable.updateValue(orderedCoffee, forKey: orderNumber)
        guard let makedCoffee = pickUpTable[orderNumber] else { return }
        print("방송: 현재 픽업 테이블에는 \(orderNumber)번 손님 \(makedCoffee) 메뉴가 나왔습니다")
    }
}
