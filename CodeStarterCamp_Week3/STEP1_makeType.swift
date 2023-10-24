
struct Person {
    let name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func buyCoffee(cafe: CoffeeShop,coffee: Coffee) {
        print("\(self.name)가(이) \(cafe.name)에서 \(coffee.name)를 구매합니다.")
    }
}

struct CoffeeShop {
    let name: String
    var sales: Int
//    var menu: [Coffee: Int]
    var barista: Person
    lazy var pickUpTable: [Coffee] = []
    
    init(name: String, sales: Int, barista: Person) {
        self.name = name
        self.sales = sales
        self.barista = barista
    }
    
    func takeOrder(orderer: Person, coffee: Coffee) {
        print("\(orderer.name)가(이) \(coffee.name)를 주문했습니다.")
    }
    
    func makeCoffe(coffee: Coffee) {
        print("바리스타 \(self.barista.name)가(이) \(coffee.name)을 제조합니다.")
    }
    
    func announceMenu(orderer: Person, coffee: Coffee) {
        print("\(orderer.name)가(이) 주문한 \(coffee.name)가 완료되었습니다.")
        print("픽업 테이블에서 가져가주세요.")
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
    let misterLee: Person = .init(name: "Lee", age: 31, money: 5000)
    let missKim: Person = .init(name: "Kim", age: 28, money: 10000)

    let yagombucks: CoffeeShop = .init(name: "yagombucks", sales: 54000, barista: misterLee)
    
    missKim.buyCoffee(cafe: yagombucks, coffee: .cafeLatte)
    yagombucks.takeOrder(orderer: missKim, coffee: .cafeLatte)
    yagombucks.makeCoffe(coffee: .cafeLatte)
    yagombucks.announceMenu(orderer: missKim, coffee: .cafeLatte)
}
