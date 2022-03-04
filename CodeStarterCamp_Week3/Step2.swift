//
//  Step2.swift
//  CodeStarterCamp_Week3
//
//  Created by 지상률 on 2022/02/28.
//

import Foundation


enum Coffee: Int {
    case Americano
    case Latte
    case Espresso
    case Juice
    case Dessert
    case Goods
    
    func printCoffeePrice()-> Int{
        switch self{
        case .Americano:
            return 4500
        case .Latte:
            return 5000
        case .Espresso:
            return 3500
        case .Dessert:
            return 6000
        case .Juice:
            return 5500
        case .Goods:
            return 3000
        }
        
    }
}

class Person {
    //name, age, money라는 저장 프로퍼티를 만들어주었다.
    var name: String
    var age: Int
    var money: Int
    
    init(){
        self.name = "missKim"
        self.age = 28
        self.money = 10000
    }
    
    init?(name: String, age: Int , money: Int) {
        if name.count == 0 {
            return nil
        }
        if (0...120).contains(age) == false {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
    }
}

class Barista : Person {
    var cafe : CoffeeShop? //나중에 CoffeeShop의 인스턴스를 할당해줄 예정이다.
}

class Customer : Person{
    var cafe : CoffeeShop?
}

class CoffeeShop {
    var cafe : String
    var revenue: Int
    var menu: Coffee!
    var barista : Barista?
    var customer : Customer?
    
    init(){
        self.revenue = 0
        self.cafe = "yagombucks"
    }
    
    init(revenue: Int, cafe: String){
        self.revenue = revenue
        self.cafe = cafe
    }
    
    func showCoffeePrint(_ price : Coffee){ //메뉴를 고르면 얼마인지 보여주는 함수
        print("\(price)의 가격은 \(price.printCoffeePrice())원 입니다.")
    }
    
    func totalRevenue(_ income : Coffee)-> Int{ //팔때마다 금액이 누적되는 함수
        let sellRevenue : Int = income.printCoffeePrice()
        revenue += sellRevenue
        return revenue
    }
    
    func order(_ menu : Coffee){ //자신의 메뉴 주문완료 표시
        if let customerName = customer?.name{
            print("\(customerName)님이 \(menu)를 선택하셨습니다.")
            let costMoney : Int = menu.printCoffeePrice()
            if let customerMoney = customer?.money{
            if customerMoney-costMoney >= 0 {
                print("결제되셨습니다. 남은 \(customerName)님의 잔액은 \(customerMoney-costMoney)입니다.")
                print("\(cafe)의 오늘 매출은 \(totalRevenue(menu))원 입니다.")//주문과 동시에 오늘 수입이 올라가는 로직이 짜보았다.
                customer?.money = customerMoney-costMoney
            }else{
                print("\(customerName)님의 잔액이 \(-(customerMoney-costMoney))원만큼 부족합니다.")
            }
            }else{
                print("nil")
            }
        }else{
            print("nil")
        }
    }
    
    func pickUpTable(ready : Bool){
        if let customerName = customer?.name{
            if ready == true {
                        print("\(customerName)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
                    }else{
                        print("아직 준비중입니다.")
                    }
        }
        else{
            print("nil")
        }
    }
}
