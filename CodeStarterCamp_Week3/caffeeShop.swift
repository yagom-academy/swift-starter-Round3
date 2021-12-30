//
//  caffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 김동욱 on 2021/12/30.
//

import Foundation

/*
 CoffeeShop 타입을 생성합니다.
 
 세상에는 많은 카페들이 있습니다.
 카페들이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
 매출액을 속성으로 가질 수 있도록 해봅시다.
 메뉴판(커피 종류, 가격)을 가질 수 있도록 해봅시다.
 커피를 올려둘 수 있는 pickUpTable을 가질 수 있도록 해봅시다.
 카페들이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
 주문을 받고, 커피를 만들어낼 수 있는 동작을 가질 수 있도록 해봅시다.
 
 Coffee 타입(열거형)을 생성합니다.
 커피의 여러 종류들을 case로 가질 수 있도록 해봅시다.
 */

struct CoffeeShop {
    //바리스타
    var barista : Person
    //하루 매출액
    var dailySales : Int = 0
    //메뉴판 딕셔너리
    var coffeeMenu : [Coffee : Int] = [Coffee.espresso : 1000, Coffee.americano : 1500, Coffee.latte : 2000, ]
    //픽업 테이블
    var pickUpTable : [String] = []
    
    //메뉴목록
    enum Coffee {
        case americano, latte, espresso
    }
    
    //주문 받아 매출액+
    mutating func takeOrder(to: Coffee){
        guard let orderPrice = coffeeMenu[to] else { return }
        dailySales += orderPrice
    }
    
    //주문받은걸 픽업테이블에 저장
    mutating func takeOrderMakeCoffee(make: Coffee){
        takeOrder(to: make)
        pickUpTable.append("\(make)")
    }
}
