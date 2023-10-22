
struct Person {
    let name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func buyCoffee(cafe: CoffeShop,coffee: Coffee) {
        print("\(self.name)가(이) \(cafe.name)에서 \(coffee.rawValue)를 구매합니다.")
    }
}

class CoffeShop {
    let name: String
    var sales: Int
    var menu: [Coffee: Int]
    var barista: Person
    lazy var pickUpTable: [String] = []
    
    init(name: String, sales: Int, menu: [Coffee : Int], barista: Person) {
        self.name = name
        self.sales = sales
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(orderer: Person, coffee: Coffee) {
        print("\(orderer.name)가(이) \(coffee.rawValue)를 주문했습니다.")
    }
    
    func makeCoffe(coffee: Coffee) {
        print("바리스타 \(self.barista.name)가(이) \(coffee.rawValue)을 제조합니다.")
    }
    
    func announceMenu(orderer: Person, coffee: Coffee) {
        print("\(orderer.name)가(이) 주문한 \(coffee.rawValue)가 완료되었습니다.")
        print("픽업 테이블에서 가져가주세요.")
    }
}

enum Coffee: String {
    case iceAmericano = "Ice Americano"
    case hotAmericano = "Hot Americano"
    case cafeLatte = "Cafe Latte"
    case coldBrew = "Cold Brew"
    case appleJuice = "Apple Juice"
    case bananaJuice = "Banana Juice"
}

let misterLee: Person = .init(name: "Lee", age: 31, money: 5000)
let missKim: Person = .init(name: "Kim", age: 28, money: 10000)


var yagombucksMenu: [Coffee: Int] = [.iceAmericano: 4500, .hotAmericano: 4200, .cafeLatte: 4600, .coldBrew: 4500, .appleJuice: 4000, .bananaJuice: 4000]
let yagombucks: CoffeShop = .init(name: "yagombucks", sales: 54000, menu: yagombucksMenu, barista: misterLee)

func start() {
    missKim.buyCoffee(cafe: yagombucks, coffee: .iceAmericano)
    yagombucks.takeOrder(orderer: missKim, coffee: .iceAmericano)
    yagombucks.makeCoffe(coffee: .iceAmericano)
    yagombucks.announceMenu(orderer: missKim, coffee: .iceAmericano)
}
