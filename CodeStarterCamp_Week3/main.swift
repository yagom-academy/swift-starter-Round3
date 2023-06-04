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
let coffeeMenus = Coffee.getCoffeeMenus()
let yagombucks = CoffeeShop(coffeeShopName: "야곰 커피샵", totalSales: 0, coffeeMenu: coffeeMenus, pickUpTable: [], barista: misterLee)

class CoffeeOrderManager {
    let person: Person
    let shop: CoffeeShop
    
    init(person: Person, shop: CoffeeShop) {
        self.person = person
        self.shop = shop
    }
    
    func initializeCoffeeManager() {
        print("원하는 기능을 선택하세요.\n1. 커피 주문\t2. 주문 확인\t3. 잔액 확인\tX. 종료")
        
        let enteredKey = readLine() ?? ""
        guard !enteredKey.isEmpty else {
            print("기능을 선택해주세요.\n")
            initializeCoffeeManager()
            return
        }
        
        switch enteredKey.lowercased() {
        case "1": orderCoffee()
        case "2": currentOrderMenus()
        case "3": showCurrentMoney()
        case "x":
            print("프로그램을 종료합니다.")
            return
        default:
            print("1, 2, 3, X 중 선택해주세요.\n")
            initializeCoffeeManager()
        }
    }
    
    func orderCoffee() {
        let coffeeMenus = shop.getCoffeeMenus()
        
        print("------메뉴------")
        for (index, coffee) in coffeeMenus.enumerated() {
            print("\(index+1). \(coffee.key)\t\(coffee.value)")
        }
        print("---------------")
        
        print("원하는 메뉴번호를 선택해주세요.")
        print("메뉴 : ", terminator: "")
        let selectedMenu = readLine() ?? ""
        guard !selectedMenu.isEmpty else {
            print("메뉴 번호를 선택해주세요.\n")
            orderCoffee()
            return
        }

        guard let selectedMenuNumber = Int(selectedMenu) else {
            print("번호를 입력해주세요.\n")
            orderCoffee()
            return
        }
        
        guard selectedMenuNumber <= coffeeMenus.count else {
            print("존재하지 않는 메뉴 번호입니다.\n")
            orderCoffee()
            return
        }
        
        let coffeeIndex = coffeeMenus.index(coffeeMenus.startIndex, offsetBy: selectedMenuNumber-1)
        let coffeeName = coffeeMenus[coffeeIndex].key
        guard let coffee = Coffee.getCoffeeFromName(name: coffeeName) else {
            return
        }
        
        self.person.orderCoffee(menu: coffee, of: shop, by: self.person.name)
        self.initializeCoffeeManager()
    }
    
    func currentOrderMenus() {
        self.shop.showPickUpTable()
        self.initializeCoffeeManager()
    }
    
    func showCurrentMoney() {
        self.person.showCurrentMoney()
        self.initializeCoffeeManager()
    }
}

let coffeeManager: CoffeeOrderManager = CoffeeOrderManager(person: missKim, shop: yagombucks)
coffeeManager.initializeCoffeeManager()
