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
    //바리스타
    var barista : Person
    //하루 매출액
    var dailySales : Int = 0
    //메뉴판 딕셔너리
    var coffeeMenu : [CoffeeList : Int] = [CoffeeList.espresso : 1000, CoffeeList.americano : 1500, CoffeeList.latte : 2000]
    //픽업 테이블
    var pickUpTable : [Int : String] = [:]
    //주문받은 음료
    var orderedCoffee : String = ""
    //오늘 몇잔 만들었는지 기록
    var makeCoffeeCount : Int = 0
    
    //주문 받아 매출액+
    mutating func takeOrder(to coffee : CoffeeList){
        guard let orderPrice = coffeeMenu[coffee] else { return }
        dailySales += orderPrice
        orderedCoffee = "\(coffee)"
        makeCoffeeCount += 1
        print("직원: 안녕하세요 손님 주문 하시겠습니까?")
        print("손님: \(coffee) 로 주세요")
        print("직원: 네 주문하신 커피는 \(coffee) 이며 금액은 \(orderPrice) 입니다")
    }
    
    //주문받은걸 픽업테이블에 저장
    mutating func takeOrderMakeCoffee(coffee : CoffeeList){
        pickUpTable.updateValue(orderedCoffee, forKey: makeCoffeeCount)
        guard let makedCoffee = pickUpTable[makeCoffeeCount] else { return }
        print("방송: 현재 픽업 테이블에는 \(makeCoffeeCount)번 손님 \(makedCoffee) 메뉴가 나왔습니다")
    }
}
