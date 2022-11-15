/*
import Foundation
 import Foundation

 struct Person {
     var name: String
     var gender: String
     var age: Int
     var money: Int
     
     mutating func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
         if let price = coffeeShop.menu[coffee] {
             if money >= price {
                 money = money - price
                 return print("커피 가격은 \(price)원입니다.\n남은 돈 \(money)원 드리겠습니다.")
             } else {
                 print("죄송합니다. 돈이 부족하여 커피를 구매할 수 없습니다.")
             }
             
         }
     }
 }


 struct CoffeeShop {
     var shopName: String
     var revenue: Int?
     var barista: Person
     var menu: [Coffee: Int] = [:]
     
     mutating func makeMenu() {
         for i in 0...3 {
             menu[Coffee.all[i]] = Coffee.all[i].rawValue
         }
     }
     
     var pickUpTable: [Coffee] = []
     
     mutating func makeCoffee(ordererName: String, coffee: Coffee) {
         pickUpTable.append(coffee)
         print("\(ordererName)님 주문하신 \(pickUpTable[0]) 나왔습니다.")
     }
 }

 enum Coffee: Int {
     case americano = 1000
     case latte = 2000
     case ade = 3000
     case smoothie = 4000
     static let all = [americano, latte, ade, smoothie]
 }


 var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 30000)
 var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 20000)
 var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, pickUpTable: [])

 yagombucks.makeMenu()
 misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
 yagombucks.makeCoffee(ordererName: "A", coffee: .americano)
*/
