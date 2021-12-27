enum Gender {
    case male, female
}

struct Person {
    var name: String
    var gender: Gender
    var money: Int = 0
    
    init(name: String, gender: Gender) {
        self.name = name
        self.gender = gender
    }
    
    init(name: String, gender: Gender, money: Int) {
        self.init(name: name, gender: gender)
        self.money = money
    }
    
    mutating func doOrder(price: Int) {
        money -= price
    }
}

struct CoffeeShop {
    enum Coffee {
        case espresso, americano, cafe_latte, cappuccino, chocolate_latte
    }
    var menu = [Coffee : Int]()
    var sales: Int = 0
    var pickUpTable: String = ""
    var barista: Person
    
    init(barista: Person) {
        menu[Coffee.espresso] = 3000
        menu[Coffee.americano] = 4000
        menu[Coffee.cafe_latte] = 4500
        menu[Coffee.cappuccino] = 4500
        menu[Coffee.chocolate_latte] = 4500
        self.barista = barista
    }
    
    mutating func order(coffee: Coffee, from: Person) -> Int? {
        if let price = menu[coffee] {
            print("주문이 접수되었습니다.")
            sales += price
            pickUpTable = from.name
            print("\(pickUpTable)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
            return price
        } else {
            print("메뉴에 없는 커피입니다. 주문을 취소합니다.")
            return nil
        }
    }
}
