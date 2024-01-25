enum Coffee {
    case Americano, ColdBrew, CafeLatte, DolceLatte, VanillaLatte
}

class Person {
    var money: Int = 0
    func breath() {
        print("숨쉬기")
    }
    func buy() {
        print("물건 사기")
    }
    func buyCoffee(from coffeeShop: Coffeeshop, sort: Coffee) {
        let price = yagombucksmenu[sort] ?? 0
        self.money -= price
        coffeeShop.totalIncome += price
        coffeeShop.makeCoffee(sort: sort)
    }
}

class Coffeeshop {
    var totalIncome: Int = 0
    var menus: [Coffee:Int] = [:]
    var pickupTable: [Coffee] = []
    var barista = misterLee
    init(menus: [Coffee:Int]) {
        self.menus = menus
    }
    func takeOrder(customer: Person, coffeeSort: Coffee) {
        print("선택하신 \(coffeeSort)의 주문이 접수되었습니다.\n")
        customer.buyCoffee(from: self, sort: coffeeSort)
    }
    func makeCoffee(sort: Coffee) {
        pickupTable.append(sort)
        print("주문하신 \(sort)가 픽업대에 준비되었습니다. 메뉴를 픽업해주세요.\n")
    }
    
}

let misterLee: Person = Person()
misterLee.money = 10000

let missKim: Person = Person()
missKim.money = 5000

let yagombucks = Coffeeshop(menus: yagombucksmenu)
let yagombucksmenu: [Coffee: Int] = [.Americano : 4000, .ColdBrew : 4500, .CafeLatte : 4500, .DolceLatte : 5000, .VanillaLatte : 5500]
yagombucks.barista = misterLee
yagombucks.takeOrder(customer: missKim, coffeeSort: .DolceLatte)


print("YagomBucks의 매출액: \(yagombucks.totalIncome)")
