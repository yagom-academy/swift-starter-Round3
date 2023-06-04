//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 4. Person 타입의 인스턴스로 misterLee , missKim 을 생성해봅시다.
var misterLee = Person(name: "MadCow", gender: Person.Gender.man, MBTI: "ISTP", age: 28)
var missKim = Person(name: "Kim", gender: Person.Gender.woman, MBTI: "ENFJ", age: 28)

// 5. CoffeeShop 타입의 인스턴스로 yagombucks 을 생성해봅시다.
// 6. yagombucks 의 바리스타(barista)를 misterLee 로 할당해봅시다.
let coffeeMenus = getCoffeeMenus()
let yagombucks = CoffeeShop(coffeeShopName: "야곰 커피샵", totalSales: 0, coffeeMenu: coffeeMenus, pickUpTable: [], barista: misterLee)

func orderCoffee(order person: Person, shop: CoffeeShop) {
    shop.showCoffeeMenu()
//    print("원하는 메뉴번호를 선택해주세요.")
//    print("메뉴 : ", terminator: "")
//    let selectedMenu = readLine() ?? ""
//    guard !selectedMenu.isEmpty else {
//        print("메뉴 번호를 선택해주세요.\n")
//        orderCoffee(order: person, shop: shop)
//        return
//    }
//
//    guard let selectedMenuNumber = Int(selectedMenu) else {
//        print("번호를 입력해주세요.\n")
//        orderCoffee(order: person, shop: shop)
//        return
//    }
//
//    guard selectedMenuNumber <= coffeeMenus.count else {
//        print("존재하지 않는 메뉴 번호입니다.\n")
//        orderCoffee(order: person, shop: shop)
//        return
//    }
}

orderCoffee(order: missKim, shop: yagombucks)
