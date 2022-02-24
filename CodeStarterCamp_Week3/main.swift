import Foundation

enum Coffee {
    case Americano
    case Latte
    case cappuccino
    case coldBrew
}

class Person {
    var money: Int
    var feeling: String
    
    func buyThings(coffee: Coffee) {
        print("안녕하세요. \(coffee) 한 잔 주시겠어요?")
    }
    init(money: Int, feeling: String) {
        self.money = money
        self.feeling = feeling
    }
}

class CoffeeShop {
    var sales: String
    var pickUpTable: Int
    var menu : [Coffee :Int] = [.Americano : 1500, .Latte : 3000, .cappuccino : 3500, .coldBrew : 4000]
    var barista: Person
    
    func makeCoffee(numberOfCoffee: Int, nameOfCoffee: String, shot: Int) {
        
        if nameOfCoffee == "americano" {
            print("\(nameOfCoffee) \(numberOfCoffee)잔 주문 받았습니다.")
            print("얼음을 가득 넣고 물을 따른 뒤 샷 \(shot)잔 추출 후 부어주기")
        } else if nameOfCoffee == "latte" {
            print("\(nameOfCoffee) \(numberOfCoffee)잔 주문 받았습니다.")
            print("얼음을 가득 넣고 우유를 따른 뒤 샷 \(shot)잔 추출 후 부어주기")
        } else if nameOfCoffee == "cappuccino" {
            print("\(nameOfCoffee) \(numberOfCoffee)잔 주문 받았습니다.")
            print("얼음을 가득 넣고 우유를 2/3 따른 뒤 우유 거품을 위에 부어 준 뒤 샷 \(shot)잔 추출 후 부어주기")
        } else if nameOfCoffee == "coldBrew" {
            print("\(nameOfCoffee) \(numberOfCoffee)잔 주문 받았습니다.")
            print("얼음을 가득 넣고 콜드브루 원액을 부어주기")
        }
    }

    init(menu: [Coffee : Int], sales: String, pickUpTable: Int, barista: Person) {
        self.menu = menu
        self.sales = sales
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
}

var misterLee: Person = Person(money: 300, feeling: "nice")
var missKim: Person = Person(money: 250, feeling: "soso")
var yagombucks: CoffeeShop = CoffeeShop(menu: [.coldBrew : 4500], sales: "$300", pickUpTable: 1, barista: misterLee)
yagombucks.barista = misterLee
