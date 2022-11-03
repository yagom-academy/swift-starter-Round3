import Foundation

class Person {
    var name: String
    var age: Int
    var gender: String
    var money: Int
    
    init(name: String, age: Int, gender: String, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
    func orderCoffee(selectedMenu: Coffee, money: Int) {
        print(selectedMenu.rawValue)
    }
    
}

class CoffeeShop {
    var sales: Int
    var pickUpTable = [String]()

    let menu: [Coffee: Int] = [.americano: 2000, .cafeLatte: 2500, .vanillaLatte: 3000, .earlGrey: 3500, .chamomile: 3500, .milkShake: 4000]
    
    var baristar: Person
    
    init(sales: Int, baristar: Person, pickUpTable: [String] = [String]()) {
        self.sales = sales
        self.pickUpTable = pickUpTable
        self.baristar = baristar
    }
    
    func takeOrder() {
        
    }
    
    func makeCoffee() {
        
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case vanillaLatte = "바닐라라떼"
    case earlGrey = "얼그레이"
    case chamomile = "캐모마일"
    case milkShake = "밀크쉐이크"
}

let misterLee: Person = .init(name: "misterLee", age: 26, gender: "man", money: 5000)
let missKim: Person = .init(name: "missKim", age: 27, gender: "woman", money: 7000)





//참조타입으로 생성하자

//class 참조타입 // struct 값타입
