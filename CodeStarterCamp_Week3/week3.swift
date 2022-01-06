class Person {
    enum Gender {
        case male, female
    }
    var name: String
    var gender: Gender
    var money: Int
    
    init(name: String, gender: Gender, money: Int = 0) {
        self.name = name
        self.gender = gender
        self.money = money
    }

    func buySomething(price: Int) {
        money -= price
    }
}
enum Coffee {
    case espresso, americano, cafeLatte, cappuccino, chocolateLatte
}

class CoffeeShop {
    
    var menu = [Coffee: Int]()
    var sales: Int = 0
    var barista: Person
    var customer: Person?
    var pickUpTable: Coffee? {
        didSet {
            if let customer = self.customer, let coffee = pickUpTable {
                print("\(customer.name) 님의 커피 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
        howMuchIsEachCoffee()
    }

    func howMuchIsEachCoffee() {
        menu[.espresso] = 1000
        menu[.americano] = 2000
        menu[.cafeLatte] = 3000
        menu[.cappuccino] = 4000
        menu[.chocolateLatte] = 5000
    }

    func order(coffee: Coffee, person: Person) {
        guard let price = menu[coffee] else {
            return
        }
        if person.money >= price {
            customer = person
            makePayment(price)
            pickUpTable = coffee
        } else {
            print("잔액이 \(price - person.money)원만큼 부족합니다.")
        }
    }
    
    func makePayment(_ price: Int) {
        if let customer = self.customer {
            customer.buySomething(price: price)
        }
        sales += price
    }
}

