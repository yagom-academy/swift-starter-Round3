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

class CoffeeShop {
    enum Coffee {
        case espresso, americano, cafeLatte, cappuccino, chocolateLatte
    }
    
    var menu = [Coffee: Int]()
    var sales: Int = 0
    var barista: Person
    var customer: Person?
    var pickUpTable: Coffee? {
        didSet {
            if let forWho = customer {
                print("\(forWho.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
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

    func order(coffee: Coffee, forWho: Person) {
        if let price = menu[coffee] {
            if forWho.money >= price {
                customer = forWho
                makePayment(price)
                pickUpTable = coffee
            } else {
                print("잔액이 \(price - forWho.money)원만큼 부족합니다.")
            }
        }
    }
    
    func makePayment(_ price: Int) {
        if let forWho = customer {
            forWho.buySomething(price: price)
        }
        sales += price
    }
}

