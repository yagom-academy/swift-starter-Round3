
struct Person {
    let name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func checkMoney() {
        print("\(self.name)의 소유 금액: \(self.money)원")
    }
    
    mutating func payMoney(_ coffee: Coffee) {
        money -= coffee.price
    }
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if self.money >= coffee.price {
            print("\(self.name)가(이) \(coffeeShop.name)에서 \(coffee.name)(\(coffee.price)원)를 주문합니다.")
            payMoney(coffee)
            coffeeShop.calculateSales(coffee)
            coffeeShop.make(coffee, from: coffeeShop.barista.name)
            coffeeShop.announceMenu(by: self, coffee: coffee)
        } else if self.money < coffee.price {
            let difference: Int = coffee.price - self.money
            print("\(self.name)님! \(coffee.name)의 금액은 \(coffee.price)원 입니다. 잔액이 \(difference)원 부족합니다.")
        }
    }
}

class CoffeeShop {
    let name: String
    var sales: Int
    var menu: [Coffee]
    var barista: Person
    var pickUpTable: [String] = []
    
    init(name: String, sales: Int, menu: [Coffee], barista: Person, pickUpTable: [String]) {
        self.name = name
        self.sales = sales
        self.menu = menu
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
    
    func checkSales() {
        print("\(self.name)의 매출액: \(self.sales)원")
    }
    
    func takeOrder(orderer: Person, coffee: Coffee) {
        print("\(orderer.name)가(이) \(coffee.name)를 주문했습니다.")
    }
    
    func announceMenu(by name: Person, coffee: Coffee) {
        let announceMent: String = "\(name.name)가(이) 주문한 \(coffee.name)가 완료되었습니다. 픽업대에서 가져가주세요."
        pickUpTable.append(announceMent)
        print(pickUpTable.last ?? "픽업대가 비었습니다.")
    }

    func calculateSales(_ coffee: Coffee) {
        sales += coffee.price
    }
    
    func make(_ coffee: Coffee, from name: String) {
        print("바리스타 \(name)가(이) \(coffee.name)을 제조합니다.")
        
    }
}

enum Coffee {
    case iceAmericano
    case hotAmericano
    case cafeLatte
    case coldBrew
    case appleJuice
    case bananaJuice
    
    var name: String {
        switch self {
        case .iceAmericano: return "Ice Americano"
        case .hotAmericano: return "Hot Americano"
        case .cafeLatte: return "Cafe Latte"
        case .coldBrew: return "Cold Brew"
        case .appleJuice: return "Apple Juice"
        case .bananaJuice: return "Banana Juice"
        }
    }
    
    var price: Int {
        switch self {
        case .iceAmericano: return 4500
        case .hotAmericano: return 4200
        case .cafeLatte: return 4600
        case .coldBrew: return 4500
        case .appleJuice: return 4000
        case .bananaJuice: return 4000
        }
    }
}

func start() {
    let misterLee: Person = .init(name: "misterLee", age: 28, money: 0)
    var missKim: Person = .init(name: "missKim", age: 27, money: 5000)
    var maru: Person = .init(name: "maru", age: 30, money: 7000)
    
    let yagombucksMenu: [Coffee] = [.iceAmericano, .hotAmericano, .cafeLatte, .coldBrew, .appleJuice, .bananaJuice]
    let yagombucks: CoffeeShop = .init(name: "yagombucks", sales: 0, menu: yagombucksMenu, barista: misterLee, pickUpTable: [])
    
    yagombucks.checkSales()
    print("--------------------------------------")
    missKim.order(.bananaJuice, of: yagombucks, by: missKim.name)
    maru.order(.iceAmericano, of: yagombucks, by: missKim.name)
    print("--------------------------------------")
    yagombucks.checkSales()
    missKim.checkMoney()
    maru.checkMoney()
}
