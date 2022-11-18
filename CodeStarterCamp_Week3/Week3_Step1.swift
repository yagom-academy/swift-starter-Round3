/*
struct Person {
    let name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee) {
        print("\(name) \(coffee.rawValue) 주문!")
        
        if money >= coffee.coffeePrice() {
            money -= coffee.coffeePrice()
            print("\(name) 잔액: \(money)원")
        } else {
            print("잔액이 \(coffee.coffeePrice() - money)원만큼 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var totalSales: Int
    var pickUpTable: Array<Coffee>
    var barista: Person
    var coffeeMenu: Dictionary<Coffee, Int> = [:]
    
    init(barista: Person) {
        self.totalSales = 0
        self.pickUpTable = []
        self.barista = barista
        
        for menu in Coffee.allCases {
            self.coffeeMenu[menu] = menu.coffeePrice()
        }
    }
    
    mutating func make(_ coffee: Coffee, from name: String) {
        totalSales += coffee.coffeePrice()
        pickUpTable.append(coffee)
        print("매출액: \(totalSales)원")
        print("픽업대: \(pickUpTable.map { $0.rawValue }.joined(separator: ", "))")
    }
}

enum Coffee: String, CaseIterable {
    case espresso = "에스프레소", americano = "아메리카노", coldBrew = "콜드브루"
    case cappuccino = "카푸치노", caffeLatte = "카페라떼", caffeMocha = "카페모카"
    
    func coffeePrice() -> Int {
        switch self {
        case .espresso:
            return 4000
        case .americano:
            return 4500
        case .coldBrew:
            return 4900
        case .cappuccino, .caffeLatte:
            return 5000
        case .caffeMocha:
            return 5500
        }
    }
}


var misterLee: Person = Person(name: "misterLee", money: 10000)
var missKim: Person = Person(name: "missKim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

missKim.order(.coldBrew)
yagombucks.make(.coldBrew, from: missKim.name)
missKim.order(.caffeLatte)
yagombucks.make(.caffeLatte, from: missKim.name)
missKim.order(.americano)
*/
