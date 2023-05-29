//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/*
 1. Person 타입을 정의합니다.
  - 사람이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
    돈이라는 속성을 가질 수 있도록 해봅시다.
  - 사람이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
    커피를 구매할 수 있도록 메서드를 정의해봅시다.
 */
class Person {
    var name: String = ""
    var gender: Gender = Gender.man
    var MBTI: String = ""
    var age: Int = 0
    var currentMoney: Int = 0
    
    enum Gender {
        case man
        case woman
    }
    
    func buyCoffee(menu: Coffee) {
        print("\(menu.coffeeName)를 구매했습니다!")
        self.currentMoney -= menu.coffeePrice
    }
    
    func selfIntroduce() {
        print("제 이름은 \(self.name)구요. 나이는 \(self.age)살, MBTI는 \(self.MBTI)입니다.")
    }
    
    func walk() {
        print("걷는다")
    }
    
    func spendMoney(price: Int) {
        self.currentMoney -= price
    }
    
    func makeMoney(salary: Int) {
        self.currentMoney += salary
    }
    
    func showCurrentMoney() {
        print("현재 잔액: \(self.currentMoney)")
    }
}

/*
 2. CoffeeShop 타입을 생성합니다.
  - 카페들이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
    매출액을 속성으로 가질 수 있도록 해봅시다.
  - 메뉴판(커피 종류, 가격)을 가질 수 있도록 해봅시다.
    pickUpTable 을 가질 수 있도록 해봅시다.
    pickUpTable은 Coffee를 담을 수 있는 배열입니다.
  - 카페들이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
    주문을 받고, 커피를 만들어낼 수 있는 동작을 가질 수 있도록 해봅시다.
    커피를 만들면 pickUpTable 에 할당할 수 있도록 해봅시다.
 */
class CoffeeShop {
    private var totalSales: Int = 0
    private var coffeeMenu: [String: String] = [:]
    private var pickUpTable: [Coffee] = []
    var barista: Person = Person()
    
    init() {
        self.loadCoffeeMenu()
    }
    
    func order(coffee menu: Coffee) {
        self.pickUpTable.append(menu)
        self.totalSales += menu.coffeePrice
    }
    
    private func loadCoffeeMenu() {
        Coffee.allCases.forEach{ coffee in
            self.coffeeMenu[coffee.coffeeName] = "\(coffee.coffeePrice)원"
        }
    }
    
    func showCoffeeMenu() {
        print("------메뉴------")
        for coffee in self.coffeeMenu {
            print("\(coffee.key)\t\(coffee.value)")
        }
        print("---------------")
    }
    
    func showPickUpTable() {
        print(self.pickUpTable)
    }
    
    func showTotalSale() {
        print(self.totalSales)
    }
}

/*
 3. Coffee 타입(열거형)을 생성합니다.
    커피의 여러 종류들을 case로 가질 수 있도록 해봅시다.
 */
enum Coffee: CaseIterable {
    case espresso
    case americano
    case latte
    case ade
    
    var coffeeName: String {
        switch self {
        case .espresso: return "에스프레소"
        case .americano: return "아메리카노"
        case .latte: return "라떼"
        case .ade: return "에이드"
        }
    }
    
    var coffeePrice: Int {
        switch self {
        case .espresso: return 2000
        case .americano: return 2000
        case .latte: return 4000
        case .ade: return 4500
        }
    }
}

// 4. Person 타입의 인스턴스로 misterLee , missKim 을 생성해봅시다.
let misterLee = Person()
misterLee.name = "MadCow"
misterLee.MBTI = "ISTP"
misterLee.age = 28
misterLee.currentMoney = 100_000

let missKim = Person()
missKim.name = "kim"
missKim.MBTI = "ENFJ"
missKim.age = 28
missKim.currentMoney = 150_000
missKim.gender = Person.Gender.woman

// 5. CoffeeShop 타입의 인스턴스로 yagombucks 을 생성해봅시다.
let yagombucks = CoffeeShop()

// 6. yagombucks 의 바리스타(barista)를 misterLee 로 할당해봅시다.
yagombucks.barista = misterLee

//yagombucks.showCoffeeMenu()
//yagombucks.order(coffee: Coffee.americano)
//yagombucks.order(coffee: Coffee.americano)
//yagombucks.order(coffee: Coffee.latte)
//yagombucks.order(coffee: Coffee.espresso)
//yagombucks.order(coffee: Coffee.ade)
//yagombucks.showPickUpTable()
//yagombucks.showTotalSale()
