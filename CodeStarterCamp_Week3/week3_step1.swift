//
//  week3_step1.swift
//  CodeStarterCamp_Week3
//
//  Created by jjudy on 2023/09/11.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case macchiato = "마끼아또"
    case flatWhite = "플랫화이트"
    case frappuccino = "프라푸치노"
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
    var face: String
 
    // 이니셜라이저
    init(name: String, age: Int, gender: Gender, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
        self.nickName = String(name.dropFirst(1))
        if gender == Gender.male { face = "🧑🏻" } else { face = "👩🏻"}
    }
    
    func walk() {
        print("\(nickName), 열심히 걷습니다!")
    }
    
    func goWork() {
        print("\(nickName), 출근합니다...")
    }
    
    func orderCoffee(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        print("\(self.face) : 안녕하세요! \(coffee.rawValue) 하나 주세요. 닉네임은 \(name)예요!")
        
        let price = coffeeShop.checkPossibleGetOrder(coffee)
        
        if price != 0 {
            if isPossiblePay(price: price) {
                self.money -= price
                coffeeShop.salesRevenue += price
                print("===결제 완료!===")
                coffeeShop.makeCoffee(coffee, from: name)
            } else {
                print("[이런! 잔액이 \(abs(self.money - price))만큼 부족합니다.\n")
            }
        }
    }
    
    func isPossiblePay(price priceOfCoffee: Int) -> Bool{
        if (self.money - priceOfCoffee) >= 0 {
            return true
        } else {
            return false
        }
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
        setMenu()
    }
    
    func setMenu() {
        menu[Coffee.americano] = 4500
        menu[Coffee.latte] = 5000
        menu[Coffee.flatWhite] = 5300
        menu[Coffee.macchiato] = 5400
    }
    
    func takeOrder() {
        print("===주문을 받습니다!===")
        print("☕️ : 안녕하세요! \(brandName)입니다. 주문 도와드릴까요?")
    }
    
    func checkPossibleGetOrder(_ coffee: Coffee) -> Int{
        if let priceOfCoffee = menu[coffee] {
            print("☕️ : 네, \(priceOfCoffee)원 입니다! 결제 부탁드려요!")
            return priceOfCoffee
        } else {
            print("☕️ : 죄송합니다 고객님, 저희는 \(coffee.rawValue) 메뉴가 없답니다")
            return 0
        }
    }
    
    func makeCoffee(_ coffee: Coffee, from name: String) {
        print("\n===음료를 제조합니다!===")
        print("지금 제조하는 메뉴는 \(coffee.rawValue)입니다")
        pickUpTable.append(coffee)
        print("☕️ : \(name)님, 주문하신 \(coffee.rawValue) 제조가 모두 완료되었습니다. 픽업대를 확인해주세요 :3\n")
    }
    
    func hireNewBarista(newBarista: Person) {
        print("\n===직원을 고용합니다!===")
        print("☕️ : 오늘부터 \(brandName) \(branchName)에서 같이 근무하게 될 \(newBarista.name)입니다! 다들 환영해주세요 :3 \n")
        baristas.append(newBarista)
    }
    
    func checkSalesRevenue() {
        print("☕️ : 오늘의 매출은 \(salesRevenue)원! 모두 고생하셨습니다 \n")
    }
    
    // missKim은 커피를 구매하는 order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) 메서드를 실행해 yagomBucks의 make(_ coffee: Coffee, from name: String) 메서드를 호출합니다.
    
}
