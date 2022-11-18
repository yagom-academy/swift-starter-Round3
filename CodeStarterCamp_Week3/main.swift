struct Person {
    let name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        print("\(name) 님이 \(coffee.rawValue)를 주문하셨습니다.")

        let balance: Int = money - coffee.coffeePrice()
        if balance >= 0 {
            money = balance
            print("* \(name) 님의 잔액은 \(money)원입니다.")
            coffeeShop.make(coffee, from: name)
        } else {
            print("* \(name) 님의 잔액이 \(-balance)원만큼 부족합니다.\n")
        }
    }
}

class CoffeeShop {
    let shopName: String
    var totalSales: Int
    var pickUpTable: Array<Coffee>
    var barista: Person
    var coffeeMenu: Dictionary<Coffee, Int> = [:]
    
    init(_ shopName: String, barista: Person) {
        self.shopName = shopName
        self.totalSales = 0
        self.pickUpTable = []
        self.barista = barista
        
        for menu in Coffee.allCases {
            self.coffeeMenu[menu] = menu.coffeePrice()
        }
    }
    
    func make(_ coffee: Coffee, from name: String) {
        if let price: Int = coffeeMenu[coffee] {
            totalSales += price
        } else {
            print("해당 메뉴의 가격을 알 수 없습니다.")
        }
        
        print("* \(shopName)의 매출액은 \(totalSales)원입니다.")
        
        var pickUpList: Array<Coffee> = pickUpTable {
            willSet {
                print("\(barista.name)(이/가) 열심히 \(coffee.rawValue)를 만들고 있습니다.")
            }
            didSet {
                print("\(name) 님이 주문하신 \(coffee.rawValue)가 준비되었습니다. 픽업대에서 가져가주세요.")
                print("* 픽업 테이블 현황: \(pickUpList.map { $0.rawValue }.joined(separator: ", "))\n")
            }
        }
        pickUpTable.append(coffee)
        pickUpList = pickUpTable
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


var missKim: Person = Person(name: "missKim", money: 10000)
var Coda: Person = Person(name: "Coda", money: 10000)
var misterLee: Person = Person(name: "misterLee", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop("yagombucks", barista: misterLee)

missKim.order(.cappuccino, yagombucks)
missKim.order(.caffeMocha, yagombucks)
Coda.order(.americano, yagombucks)
