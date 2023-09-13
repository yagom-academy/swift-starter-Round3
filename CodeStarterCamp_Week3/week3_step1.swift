//
//  week3_step1.swift
//  CodeStarterCamp_Week3
//
//  Created by jjudy on 2023/09/11.
//

import Foundation

enum Coffee: String {
    case americano = "americano"
    case latte = "latte"
    case macchiato = "macchiato"
    case flatWhite = "flatWhite"
    case frappuccino = "frappucino"
}

class Person {
    enum Gender {
        case male
        case female
    }
    
    var name: String
    var age: Int
    var gender: Gender
    var money: Int
    var nickName: String
 
    // 이니셜라이저
    init(name: String, age: Int, gender: Gender, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
        self.nickName = String(name.dropFirst(1))
    }
    
    func walk() {
        print("\(nickName), 열심히 걷습니다!")
    }
    
    func goWork() {
        print("\(nickName), 출근합니다...")
    }
    
    func buyCoffee() {
        print("\(nickName), 도핑을 위한 커피 구입! 🥳")
    }
    
    func sleep() {
        print("\(nickName), 잠에 듭니다! 좋은 밤~😴")
    }
}

class CoffeeShop {
    var brandName: String
    var branchName: String
    var salesRevenue: Int
    var baristas: Array<Person>
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee>
    
    // 이니셜라이저
    init(brandName: String, branchName: String) {
        self.brandName = brandName
        self.branchName = branchName
        self.salesRevenue = 0
        self.baristas = [Person]()
        self.menu = [Coffee: Int]()
        self.pickUpTable = [Coffee]()
    }
    
    func takeOrder() {
        print("===주문을 받습니다!===")
        print("안녕하세요! \(brandName)입니다. 주문 도와드릴까요?")
    }
    
    func makeCoffee(orderedMenu: Coffee) {
        print("===음료를 제조합니다!===")
        print("지금 제조하는 메뉴는 \(orderedMenu)입니다")
        pickUpTable.append(orderedMenu)
        print("제조가 모두 완료되었습니다. 픽업대를 확인해주세요 :3")
    }
    
    func hireNewBarista(newBarista: Person) {
        print("===직원을 고용합니다!===")
        print("오늘부터 \(brandName) \(branchName)에서 같이 근무하게 될 \(newBarista.name)입니다! \n다들 환영해주세요 :3")
        baristas.append(newBarista)
    }
    
}
