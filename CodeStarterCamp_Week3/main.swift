import Foundation

enum Coffee {
    case americano, cafeLatte, espresso
}

struct Person {
    var name: String = "free"
    var money: Int = 0

    func buy(product: String) {
        print("\(product)를 구매하였습니다.")
    }
}

struct CoffeeShop {
    var cafeSales: Int = 0
    var menu: [Coffee : Int] = [.americano : 2500, .cafeLatte : 3000, .espresso : 4000]
    var pickUpTable: Coffee?
    var barista: Person = Person()

    mutating func takeOrderMake(coffee: Coffee, customer: Person) {
        var customerMoney = customer.money

        print("\(coffee)를 주문 받았습니다.")

        if let cost = menu[coffee] {
            if customerMoney < cost {
                print("잔액이 \(cost - customerMoney)원 부족합니다.")
            } else {
                customerMoney -= cost
                cafeSales += cost

                pickUpTable = coffee
            }
        }
        if let _ = pickUpTable {
            print("\(customer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
}

var misterLee: Person = Person(name: "misterLee", money: 10000)
var missKim: Person = Person(name: "missKim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee
yagombucks.takeOrderMake(coffee: .americano, customer: missKim)
