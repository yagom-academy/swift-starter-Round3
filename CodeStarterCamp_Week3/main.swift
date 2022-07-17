
class Person {
    var name: String
    var gender: String
    var money: Int
    init (name: String, gender: String, money: Int){
        self.name = name
        self.gender = gender
        self.money = money
    }
    func buy(coffee:Coffee, coffeeshop:CoffeeShop){
        print("\(coffeeshop)에서 \(coffee)를 구매합니다.")
    }
}

class CoffeeShop {
    var totalSales: Int
    enum menuBoard: Int {
        case cappucino = 3500, iceamericano = 1500, latte = 1400, cafemoca = 3000
    }
    var pickupTable: Array<Coffee> = [Coffee]()
    var barista: Person
    
    init (barista: Person){
        self.totalSales = 0
        self.barista = barista
    }
    func takeOrder (name:String, coffee:Coffee){
        print ("\(name)님의 \(coffee)를 주문받았습니다.")
        make(coffee: coffee, name: name)
    }
    func make (coffee: Coffee, name: String){
        print("\(name)님이 주문하신 \(coffee)를 만들고 있습니다.")
        pickupTable.append(coffee)
    }
}

enum Coffee {
    case cappucino, iceamericano, latte, cafemoca
}

let misterLee : Person = Person(name: "misterLee", gender: "male", money: 5000)
let missKim: Person = Person(name: "missKim", gender: "female", money: 3500)
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)
