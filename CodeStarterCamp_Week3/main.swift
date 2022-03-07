struct PersonalInformation {
    var socialSecurityNumber = "999999-1111111"
    var name = "성이름"
    var age = 0
    var residence = "서울"
    var phoneNumber = "010-0000-0000"
    var job: String?
    var school: String?
    var company: String?
}

struct PhysicalInformation {
    var height = 0.0
    var weight = 0.0
    var eyes = 2
    var nose = true
    var mouse = true
    var ears = 2
    var arms = 2
    var hands = 2
    var legs = 2
    var feet = 2
}

class Person {
    var personalInformation = PersonalInformation()
    var physicalInformation = PhysicalInformation()
    var money: Int
    
    init?(socialSecurityNumber: String, name: String, age: Int, residence: String, phoneNumber: String, height: Double, weight: Double, money: Int) {
        if socialSecurityNumber.count == 0 {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        if (0...130).contains(age) == false {
            return nil
        }
        if residence.count == 0 {
            return nil
        }
        if phoneNumber.count == 0 {
            return nil
        }
        if height < 0 {
            return nil
        }
        if weight < 0 {
            return nil
        }
        self.personalInformation.socialSecurityNumber = socialSecurityNumber
        self.personalInformation.name = name
        self.personalInformation.age = age
        self.personalInformation.residence = residence
        self.personalInformation.phoneNumber = phoneNumber
        self.physicalInformation.height = height
        self.physicalInformation.weight = weight
        self.money = money
    }
    
    init?(socialSecurityNumber: String, name: String, age: Int, residence: String, phoneNumber: String, job: String?, school: String?, company: String?, height: Double, weight: Double, money: Int) {
        if socialSecurityNumber.count == 0 {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        if (0...130).contains(age) == false {
            return nil
        }
        if residence.count == 0 {
            return nil
        }
        if phoneNumber.count == 0 {
            return nil
        }
        if height < 0 {
            return nil
        }
        if weight < 0 {
            return nil
        }
        self.personalInformation.socialSecurityNumber = socialSecurityNumber
        self.personalInformation.name = name
        self.personalInformation.age = age
        self.personalInformation.residence = residence
        self.personalInformation.phoneNumber = phoneNumber
        self.personalInformation.job = job
        self.personalInformation.school = school
        self.personalInformation.company = company
        self.physicalInformation.height = height
        self.physicalInformation.weight = weight
        self.money = money
    }
    
    deinit {
            print("\(personalInformation.name)이 사망하셨습니다.")
            }
    
    func see() {
        if physicalInformation.eyes > 0 {
            print("\(personalInformation.name)이 사물을 봅니다")
        } else {
            print("\(personalInformation.name)이 사물을 보지 못합니다")
        }
        
    }
    
    func breath() {
        if physicalInformation.nose == true {
            print("\(personalInformation.name)이 숨을 쉽니다.")
        } else {
            print("\(personalInformation.name)이 숨을 쉬지 못합니다")
        }
    }
    
    func hear() {
        if physicalInformation.mouse == true {
            print("\(personalInformation.name)이 듣습니다.")
        } else {
            print("\(personalInformation.name)이 듣지 못합니다")
        }
    }
    
    func clap() {
        if physicalInformation.arms > 1 , physicalInformation.hands > 1{
            print("\(personalInformation.name)이 박수를 칩니다.")
        } else {
            print("\(personalInformation.name)이 박수를 치지 못합니다")
        }
    }
    
    func run() {
        if physicalInformation.legs > 1 , physicalInformation.feet > 1{
            print("\(personalInformation.name)이 달립니다.")
        } else {
            print("\(personalInformation.name)이 달리지 못합니다")
        }
    }
    
    func buy(to things: [String: Int], _ thingsName: String) {
        guard let things = things[thingsName] else {
            print("물건이 없습니다.")
            return
        }
        print("\(personalInformation.name)이 \(thingsName)을(를) 구매하였습니다!")
        money -= things
        print("현재 \(personalInformation.name)이 보유한 돈은 \(money)입니다.")
    }
}

class CoffeeShop {
    enum Coffee: String {
        case americano
        case caffeeLatte
        case caffeMocha
        case cappuccino
        case caramelMacchiato
        case espresso
        case hazlnutLatte
        case vienna
        
        static let coffeeList = [americano, caffeeLatte, caffeMocha, cappuccino, caramelMacchiato, espresso, hazlnutLatte, vienna]
    }
    
    var cafeName: String
    var barista: Person?
    var coffeeMachine = "DolcheGusto"
    var table = 10
    var chair = 10
    var cup = 20
    var straw = 20
    var counterPosMachine = 0
    var salesMoney = 100000
    var menu: [Coffee: String] = [:]
    var pickUpTable: [String: Int] = [:]

    init(cafeName: String) {
        self.cafeName = cafeName
    }
    
    func decideCoffeePrice() {
        var loopCount = 0

        while loopCount < Coffee.coffeeList.count {
            print("\'\(Coffee.coffeeList[loopCount])\'의 가격을 숫자로 입력하여 결정하세요!")
            let coffeePrice = readLine()
            if let coffeePrice = coffeePrice {
                if coffeePrice.isEmpty {
                    print("다시 입력 바랍니다!")
                } else {
                print("\'\(Coffee.coffeeList[loopCount])\'의 가격은 \(coffeePrice)원 입니다.")
                print()
                storeMenu(coffeeName: Coffee.coffeeList[loopCount], coffeePrice: coffeePrice)
                    loopCount += 1
                }
            }
            }
    }
        
    func storeMenu(coffeeName: Coffee, coffeePrice: String) {
        menu[coffeeName] = coffeePrice
    }
    
    func order(to barista: Person?, for customer: Person?) {
        if let customer = customer, let barista = barista {
            print("\(customer.personalInformation.name): 메뉴판을 보여주세요.")
            print("\(barista.personalInformation.name): 메뉴판을 보여준다.")
            printMenu()
            print()
            print("메뉴를 골라 말해주세요.")
            decideCoffeeMenu(to: customer)
        }
    }

    func printMenu() {
        print()
        print("!!***** \(cafeName) 카페 메뉴 *****!!")
        
        for menuMember in menu {
            print("\(menuMember.key): \(menuMember.value)원")
        }
    }
    
    func decideCoffeeMenu(to customer: Person) {
        while true {
            print("!!** 메뉴에서 \'X\'를 누르시면 결제가 진행됩니다 **!!")
            print("메뉴: ", terminator: " ")
            let coffeeName = readLine()
                
            if let coffeeName = coffeeName {
                if coffeeName == "X" {
                    print("주문이 종료되었습니다!")
                    break
                }
            }
                
            print("잔: ", terminator: " ")
            let coffeeCount = readLine()
                
            if let coffeeName = coffeeName, let coffeeCount = coffeeCount {
                var count = 0
                    
                while count < Coffee.coffeeList.count {
                    if coffeeName == Coffee.coffeeList[count].rawValue {
                        print("\(customer.personalInformation.name)님이 \(coffeeName) 커피: \(coffeeCount)잔을 골랐습니다!")
                        calculateNowPrice(coffeeName, coffeeCount, menu)
                        pickUpTable[coffeeName] = Int(coffeeCount)
                }
                count += 1
            }
        }
    }
    }
    
    func calculateNowPrice(_ coffeeName: String, _ coffeecount: String, _ menu: [Coffee: String]) {
           var count = 0
           
           while count < Coffee.coffeeList.count {
               if coffeeName == Coffee.coffeeList[count].rawValue {
                   if let price = menu[Coffee.coffeeList[count]] {
                       
                       let resultPrice = Int(price)
                       let resultCoffeeCount = Int(coffeecount)
                       
                       if let resultPrice = resultPrice, let resultCoffeeCount = resultCoffeeCount {
                        counterPosMachine += resultPrice * resultCoffeeCount
                       print("현재까지 계산 가격은 \(counterPosMachine)원 입니다!")
                       print()
                       }
                   }
               }
               count += 1
           }
       }
       
    func calculateAllPricePay(to cafe: CoffeeShop, for customer: Person?) {
        if let customer = customer {
            print()
            print("!!*** 계산 내역입니다 ***!!")
            print("카페의 이전 매출은 \(salesMoney)입니다.")
            print("총 지불할 가격은 \(counterPosMachine)입니다.")
            print("카페의 현재 매출은 \(salesMoney + counterPosMachine)입니다.")
            print("손님의 남은 돈은 \(customer.money - counterPosMachine)입니다.")
        }
    }
       
    func makeCoffee(for customer: Person?) {
        print()
        print("!!*** 주문 받은 커피 내역입니다 ***!!")
        print(pickUpTable)
        print()
           
        for pickUpTableKey in pickUpTable.keys {
            if let coffeeCount = pickUpTable[pickUpTableKey] {
            print("\(pickUpTableKey) 커피 \(coffeeCount)잔이 만들어졌습니다!")
            pickUpTable.removeValue(forKey: pickUpTableKey)
            }
        }
           
        if let customer = customer {
            print()
            print("\(customer.personalInformation.name)님! 커피 준비가 완료되었습니다. 가져가주시기 바랍니다!")
        }
    }
    
    func playCoffeeShopGame(_ baristaPlayer: Person?, _ customerPlayer: Person?, _ coffeeShop: CoffeeShop) {
        barista = baristaPlayer
        decideCoffeePrice()
        order(to: barista, for: customerPlayer)
        calculateAllPricePay(to: coffeeShop, for: customerPlayer)
        makeCoffee(for: customerPlayer)
        
    }
}

var misterLee = Person(socialSecurityNumber: "999999-1111111", name: "misterLee", age: 24, residence: "서울", phoneNumber: "010-1234-5678", height: 170.5, weight: 80.3, money: 100000)
var missKim = Person(socialSecurityNumber: "999999-4444444", name: "missKim", age: 20, residence: "경기도", phoneNumber: "010-5678-1234", height: 161.3, weight: 50.2, money: 100000)
var yagombucks = CoffeeShop(cafeName: "yagombucks")

yagombucks.playCoffeeShopGame(misterLee, missKim, yagombucks)
