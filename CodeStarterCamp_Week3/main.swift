import Foundation

enum Coffee {
    case americano, cafeLatte, espresso
}

struct Person {
    var name: String
    var money: Int = 0
    
    func buy(product: String) {
        print("\(product)를 구매하였습니다.")
    }
}

struct CoffeeShop {
    var cafeSales: Int = 0
    var barista: String?
    var customers: Person?
    var menu: [Coffee : Int] = [.americano : 2500, .cafeLatte : 3000, .espresso : 4000]
    var pickUpTable: Coffee? {
        willSet(finishedCoffee) {
            if let customerCoffee = finishedCoffee {
                if let customersName = customers?.name {
                    print("\(customersName) 님의 \(customerCoffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
    }
    
    mutating func takeOrderMake(coffee: Coffee, customer: inout Person) {
        print("\(coffee)를 주문 받았습니다.")
        
        if let cost = menu[coffee] {
            if cost > customer.money {
                print("잔액이 \(cost - customer.money)원 부족합니다.")
            }else {
                customer.money -= cost
                cafeSales += cost
                
                pickUpTable = coffee
            }
        }
    }
}

var misterLee: Person = Person(name: "misterLee", money: 10000)
var missKim: Person = Person(name: "missKim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee.name
yagombucks.customers = missKim
yagombucks.takeOrderMake(coffee: .americano, customer: &missKim)

