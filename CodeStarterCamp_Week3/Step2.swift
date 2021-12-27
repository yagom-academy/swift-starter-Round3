//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 조성훈 on 2021/12/22.
//

//
//import Foundation
//
//class Person {
//    let name: String
//    var money: Int
//    
//    init (name: String, money: Int){
//        self.name = name
//        self.money = money
//    }
//    
//    func buyItem() {
//        print("물건을 구입하셨습니다.")
//    }
//}
//
//class CoffeeShop {
//    var barista: Person?
//    var sales: Int
//    var menuBoard: Menu
//    var coffee: CoffeeType
//    var price: Int
//    var pickUpTable: Int
//    
//    init (sales: Int, coffee: CoffeeType, price: Int, pickUpTable: Int) {
//        self.sales = sales
//        self.coffee = coffee
//        self.price = price
//        self.pickUpTable = pickUpTable
//    }
//    
//    func orderAndMakeCoffee() {
//        print("커피를 주문하셨습니다. 커피를 만듭니다.")
//    }
//}
//
//class Menu {
//    var
//}
//enum CoffeeType {
//    case americano, cafeLatte, espresso, cappuccino, cafeMocha
//}
//
//let misterLee = Person(name: "misterLee", money: 100_000)
//let missKim = Person(name: "missKim", money: 200_000)
//let yagombucks = CoffeeShop(sales: 10_000_000, coffee: .americano , price: 4_500, pickUpTable: 10)
//yagombucks.barista = misterLee
//
//if let baristaName = yagombucks.barista?.name {
//    print("바리스타 이름은 \(baristaName)입니다.")
//} else {
//    print("바리스타가 없습니다. 사장이 직접 운영해요.")
//}
//
