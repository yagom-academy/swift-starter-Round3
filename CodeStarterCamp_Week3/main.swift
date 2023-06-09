//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/* Defining Person
 - Person 타입을 정의합니다.
 - 사람이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
 - 돈이라는 속성을 가질 수 있도록 해봅시다.
 - 사람이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
 - 커피를 구매할 수 있도록 메서드를 정의해봅시다.
 */

class Person {
    private var name: String
    private var money: Int
    private var gender: Gender
    var job: CoffeeShop?
    private var drinkSelected: [CoffeeShop.Coffee: Int]
    
    init(name: String, money: Int, gender: Gender, job: CoffeeShop? = nil, drinkSelected: [CoffeeShop.Coffee: Int] = [:]) {
        self.name = name
        self.money = money
        self.gender = gender
        self.job = job
        self.drinkSelected = drinkSelected
    }

    enum Gender {
        case male, female
    }
    
    func introduceToOthers() {
        print("안녕하세요, 제 이름은\(name)이고 \(gender)입니다.")
        if !drinkSelected.isEmpty {
            print("제가 고른 음료는 \(drinkSelected.keys), \(drinkSelected.values)")
        }
    }
    
    func chooseCoffee(drink: CoffeeShop.Coffee, count: Int) {
        drinkSelected.updateValue(count, forKey: drink)
        print("\(drink)를 \(count)잔 샀습니다.")
    }
    
    func checkAmount(_ drink: CoffeeShop.Coffee, _ count: Int) -> Int {
        let totalCost = (drink.price * count)
        if money >= totalCost {
            print("아직 구매 가능해!")
            return self.money
        } else {
            print("집이나 가자...")
            return self.money
        }
    }
    
    func buyCoffee(drink: CoffeeShop.Coffee, count: Int) {
        let cost = (drink.price * count)
        guard money >= cost else { print("잔액이 부족합니다"); return }
        money -= cost
        print("\(drink)를 \(count)잔 샀습니다.")
        print("이제 돈이 \(money) 남았네요")
        drinkSelected = [:]
    }
}

/* Defining CoffeeShop
 - CoffeeShop 타입을 생성합니다. 세상에는 많은 카페들이 있습니다. 카페들이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
 - 매출액을 속성으로 가질 수 있도록 해봅시다.
 - 메뉴판(커피 종류, 가격)을 가질 수 있도록 해봅시다.
 - pickUpTable 을 가질 수 있도록 해봅시다. pickUpTable은 Coffee를 담을 수 있는 배열입니다.
 - 카페들이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다. 주문을 받고, 커피를 만들어낼 수 있는 동작을 가질 수 있도록 해봅시다.
 - 커피를 만들면 pickUpTable 에 할당할 수 있도록 해봅시다.
 */

class CoffeeShop {
    private var name: String
    private var totalProfit: Int
    private var menu: [Coffee: Int]
    private var pickupTable: [Coffee]
    private var barista: Person?
    
    init(name: String, totalProfit: Int, menu: [Coffee: Int], pickupTable: [Coffee], barista: Person? = nil) {
        self.name = name
        self.totalProfit = totalProfit
        self.menu = menu
        self.pickupTable = pickupTable
        self.barista = barista
    }
    
    enum Coffee {
        case americano
        case espresso
        case latte
        
        var price: Int {
            switch self {
            case .americano:
                return 20
            case .espresso:
                return 10
            case .latte:
                return 30
            }
        }
    }
    
    func hireBarista(worker: Person) {
        self.barista = worker
    }
    
    func takeOrder(coffee: Coffee, count: Int) {
        print("주문 확인하겠습니다. \(coffee) \(count)잔이 맞을까요?")
    }
    
    func brewCoffee(coffee: Coffee, count: Int) {
        pickupTable.append(coffee)
        print("\(coffee) \(count)잔 나왔습니다")
    }
}

let misterLee = Person(name: "미스터리", money: 100, gender: .male)
let missKim = Person(name: "미스킴", money: 100, gender: .female)

let yagomBucks = CoffeeShop(name: "야곰벅스", totalProfit: 0, menu: [:], pickupTable: [])
yagomBucks.hireBarista(worker: misterLee)
