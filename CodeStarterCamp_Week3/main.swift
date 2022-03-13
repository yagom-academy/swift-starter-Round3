protocol AnimalAct {
    func breath()
    func eat()
    func hear()
    func move()
    func see()
}

protocol AnimalBody {
    var height: Double { get set }
    var weight: Double { get set }
    var arms: Int { get }
    var ears: Int { get }
    var eyes: Int { get }
    var feet: Int { get }
    var hands: Int { get }
    var legs: Int { get }
    var mouse: Int { get }
    var nose: Int { get }
    
    mutating func setBreakBody()
}

struct PersonAct: AnimalAct {
    func breath() {
        print("이 숨을 쉽니다.")
    }
    
    func eat() {
        print("이 먹습니다.")
    }
    
    func hear() {
        print("이 듣습니다.")
    }
    
    func move() {
        print("이 움직입니다.")
    }
    
    func see() {
        print("이 봅니다.")
    }
}

struct PersonBody: AnimalBody {
    var height: Double
    var weight: Double
    var breakArms: Int = 0
    var breakEars: Int = 0
    var breakEyes: Int = 0
    var breakFeet: Int = 0
    var breakHands: Int = 0
    var breakLegs: Int = 0
    var breakMouse: Int = 0
    var breakNose: Int = 0
    
    var arms: Int {
        get {
            return 2 - breakArms
        }
    }
    var ears: Int {
        get {
            return 2 - breakEars
        }
    }
    var eyes: Int {
        get {
            return 2 - breakEyes
        }
    }
    var feet: Int {
        get {
            return 2 - breakFeet
        }
    }
    var hands: Int {
        get {
            return 2 - breakHands
        }
    }
    var legs: Int {
        get {
            return 2 - breakLegs
        }
    }
    var mouse: Int {
        get {
            return 1 - breakMouse
        }
    }
    var nose: Int {
        get {
            return 1 - breakNose
        }
    }
    
    mutating func setBreakBody() {
        print("""
             신체의 어느 부분이 다치셨습니까?
             1. 눈
             2. 귀
             3. 팔
             4. 손
             5. 다리
             6. 발
             7. 코
             8. 입
             
             입력:
             """, terminator: " ")
        let bodyName = readLine()
        
        print("그 부분을 몇 군데 다치셨습니까?", terminator: " ")
        let bodyNameCount = readLine()
        
        if let bodyName = bodyName, let bodyNameCount = bodyNameCount {
            let bodyNameLiteral = bodyName
            let bodyNameCountInteger = Int(bodyNameCount)
            
            if let bodyNameCountInteger = bodyNameCountInteger {
                switch bodyNameLiteral {
                case "1":
                    breakEyes = bodyNameCountInteger
                case "2":
                    breakEars = bodyNameCountInteger
                case "3":
                    breakArms = bodyNameCountInteger
                case "4":
                    breakHands = bodyNameCountInteger
                case "5":
                    breakLegs = bodyNameCountInteger
                case "6":
                    breakFeet = bodyNameCountInteger
                case "7":
                    breakNose = bodyNameCountInteger
                case "8":
                    breakMouse = bodyNameCountInteger
                default:
                    print("잘못된 번호를 입력하셨습니다")
                }
            }
        }
    }
}

struct PersonInformation {
    var name: String
    var age: Int
    var socialSecurityNumber: String
    var residence: String
    var money: Int
    var phoneNumber: String? = nil
    var job: String? = nil
    var school: String? = nil
    var company: String? = nil
}



class Person {
    var personInformation: PersonInformation
    var personBody: PersonBody
    let personAct: PersonAct
    
    init(personInformation: PersonInformation, personBody: PersonBody, personAct: PersonAct) {
        self.personInformation = personInformation
        self.personBody = personBody
        self.personAct = personAct
    }
    
    deinit {
        print("\(self.personInformation.name)이 사망하셨습니다.")
    }
    
    func breath() {
        if self.personBody.nose > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.breath()
        } else {
            print("\(self.personInformation.name)이 숨을 쉬지 못합니다.")
        }
    }
    
    func eat() {
        if self.personBody.mouse > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.eat()
        } else {
            print("\(self.personInformation.name)이 먹지 못합니다.")
        }
    }
    
    func hear() {
        if self.personBody.ears > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.hear()
        } else {
            print("\(self.personInformation.name)이 듣지 못합니다.")
        }
    }
    
    func move() {
        if self.personBody.legs > 1 , self.personBody.feet > 1 {
            print(self.personInformation.name, terminator: "")
            self.personAct.move()
        } else {
            print("\(self.personInformation.name)이 움직이지 못합니다.")
        }
    }
    
    func see() {
        if self.personBody.eyes > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.see()
        } else {
            print("\(self.personInformation.name)이 보지 못합니다.")
        }
    }
    
    func clap() {
        if self.personBody.arms > 1 , self.personBody.hands > 1{
            print("\(self.personInformation.name)이 박수를 칩니다.")
        } else {
            print("\(self.personInformation.name)이 박수를 치지 못합니다")
        }
    }
}

class Customer: Person {
    func buy(to things: [String: Int], _ thingsName: String) {
        guard let things = things[thingsName] else {
            print("물건이 없습니다.")
            return
        }
        print("\(self.personInformation.name)이 \(thingsName)을(를) 구매하였습니다!")
        self.personInformation.money -= things
        print("현재 \(self.personInformation.name)이 보유한 돈은 \(self.personInformation.money)원 입니다.")
    }
}

class CoffeeShop {
    enum Coffee: String, CaseIterable {
        case americano
        case caffeeLatte
        case caffeMocha
        case cappuccino
        case caramelMacchiato
        case espresso
        case hazlnutLatte
        case vienna
    }
    
    let cafeName: String
    var barista: Person
    var counterPosMachineMoney = 0
    var salesMoney = 100000
    var menu: [String: Int] = [:]
    var pickUpTable: [String: Int] = [:]
    lazy var coffeeMachine: String = ""
    lazy var table: Int = 0
    lazy var chair: Int = 0
    lazy var cup: Int = 0
    lazy var straw: Int = 0
    
    init(cafeName: String, barista: Person) {
        self.cafeName = cafeName
        self.barista = barista
    }
    
    func setCafeObject() {
        print("\(self.cafeName)카페의 물건들을 세팅해봅시다!")
        
        print("커피 머신 브랜드:", terminator: " ")
        let coffeeMachineSelect = readLine()
        if let coffeeMachineSelect = coffeeMachineSelect {
            self.coffeeMachine = coffeeMachineSelect
        }
        
        while true {
            var loopIsNumberCount = 0
            print("책상 갯수:", terminator: " ")
            let tableSelect = readLine()
            if let tableSelect = tableSelect {
                for tableSelectChar in tableSelect {
                    if !tableSelectChar.isNumber {
                        print("다시 입력 바랍니다!")
                        print()
                        break
                    } else {
                        loopIsNumberCount += 1
                    }
                }
                if loopIsNumberCount == tableSelect.count {
                    self.table = Int(tableSelect)!
                    print()
                    break
                }
            }
        }
        
        while true {
            var loopIsNumberCount = 0
            print("의자 갯수:", terminator: " ")
            let chariSelect = readLine()
            if let chariSelect = chariSelect {
                for chairSelectChar in chariSelect {
                    if !chairSelectChar.isNumber {
                        print("다시 입력 바랍니다!")
                        print()
                        break
                    } else {
                        loopIsNumberCount += 1
                    }
                }
                if loopIsNumberCount == chariSelect.count {
                    self.chair = Int(chariSelect)!
                    print()
                    break
                }
            }
        }
        
        while true {
            var loopIsNumberCount = 0
            print("컵 갯수:", terminator: " ")
            let cupSelect = readLine()
            if let cupSelect = cupSelect {
                for cupSelectChar in cupSelect {
                    if !cupSelectChar.isNumber {
                        print("다시 입력 바랍니다!")
                        print()
                        break
                    } else {
                        loopIsNumberCount += 1
                    }
                }
                if loopIsNumberCount == cupSelect.count {
                    self.cup = Int(cupSelect)!
                    print()
                    break
                }
            }
        }
        
        while true {
            var loopIsNumberCount = 0
            print("빨대 갯수:", terminator: " ")
            let strawSelect = readLine()
            if let strawSelect = strawSelect {
                for strawSelectChar in strawSelect {
                    if !strawSelectChar.isNumber {
                        print("다시 입력 바랍니다!")
                        print()
                        break
                    } else {
                        loopIsNumberCount += 1
                    }
                }
                if loopIsNumberCount == strawSelect.count {
                    self.straw = Int(strawSelect)!
                    print()
                    break
                }
            }
        }
        
        print("""
              !*** 카페에 물건이 구비되었습니다 ***!
              커피머신: \(self.coffeeMachine)
              책: \(self.table)개
              의자: \(self.chair)개
              컵: \(self.cup)개
              빨대: \(self.straw)개
              """)
    }
    
    func decideCoffeePrice() {
        var loopCount = 0
        let coffeeList = Coffee.allCases.map({ "\($0)" })
        
        while loopCount < coffeeList.count {
            var loopIsNumberCount = 0
            
            print("\'\(coffeeList[loopCount])\'의 가격을 숫자로 입력하여 결정하세요!")
            let coffeePrice = readLine()
            
            guard let coffeePrice = coffeePrice else {
                continue
            }
            
            for coffeePriceChar in coffeePrice {
                if !coffeePriceChar.isNumber {
                    print("다시 입력 바랍니다!")
                    print()
                    loopCount -= 1
                    break
                }
                loopIsNumberCount += 1
                if loopIsNumberCount == coffeePrice.count {
                    print("\'\(coffeeList[loopCount])\'의 가격은 \(coffeePrice)원 입니다.")
                    print()
                    storeMenu(coffeeName: coffeeList[loopCount], coffeePrice: Int(coffeePrice)!)
                }
            }
            loopCount += 1
        }
    }
        
    func storeMenu(coffeeName: String, coffeePrice: Int) {
        menu[coffeeName] = coffeePrice
    }
    
    func order(to barista: Person, for customer: Person) {
        print("\(customer.personInformation.name): 메뉴판을 보여주세요.")
        print("\(barista.personInformation.name): 메뉴판을 보여준다.")
        printMenu()
        print()
        print("메뉴를 골라 말해주세요.")
        decideCoffeeMenu(to: customer)
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
            var coffeeCountInteger = 0
            var loopIsNumberCount = 0
            
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
            
            guard let coffeeName = coffeeName, let coffeeCount = coffeeCount else {
                continue
            }
            
            for coffeeCountChar in coffeeCount {
                if !coffeeCountChar.isNumber {
                    print("다시 잔 수를 '숫자'로 입력 바랍니다!")
                    print()
                    loopIsNumberCount += 1
                    break
                }
            }
            if loopIsNumberCount == 1 {
                continue
            } else {
                coffeeCountInteger = Int(coffeeCount)!
            }
            
            menu.forEach { (menuName, price) in
                if coffeeName == menuName {
                    print("\(customer.personInformation.name)님이 \(coffeeName) 커피 \(coffeeCountInteger)잔을 골랐습니다!")
                    calculateNowPrice(coffeeName: coffeeName, coffeeCount: coffeeCountInteger)
                    pickUpTable[coffeeName] = Int(coffeeCount)
                }
            }
        }
    }
    
    func calculateNowPrice(coffeeName: String, coffeeCount: Int) {
        menu.forEach { (menuName, price) in
                   if coffeeName == menuName {
                       counterPosMachineMoney += price * coffeeCount
                   }
               }
               print("현재까지 계산 가격은 \(counterPosMachineMoney)원 입니다!")
               print()
       }
       
    func calculateAllPricePay(to cafe: CoffeeShop, for customer: Person?) {
        if let customer = customer {
            print()
            print("!!*** 계산 내역입니다 ***!!")
            print("카페의 이전 매출은 \(salesMoney)입니다.")
            print("총 지불할 가격은 \(counterPosMachineMoney)입니다.")
            print("카페의 현재 매출은 \(salesMoney + counterPosMachineMoney)입니다.")
            print("손님의 남은 돈은 \(customer.personInformation.money - counterPosMachineMoney)입니다.")
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
            print("\(customer.personInformation.name)님! 커피 준비가 완료되었습니다. 가져가주시기 바랍니다!")
        }
    }
    
    func playCoffeeShopGame(customerPlayer: Person, coffeeShop: CoffeeShop) {
        decideCoffeePrice()
        order(to: barista, for: customerPlayer)
        calculateAllPricePay(to: coffeeShop, for: customerPlayer)
        makeCoffee(for: customerPlayer)
    }
}

var personBodyMisterLee = PersonBody(height: 175, weight: 60)
var personActMisterLee = PersonAct()
var personInformationMisterLee = PersonInformation(name: "Lee", age: 24, socialSecurityNumber: "999999-2222222", residence: "서울", money: 100000)

var personBodyMissKim = PersonBody(height: 160, weight: 50)
var personActMissKim = PersonAct()
var personInformationMissKim = PersonInformation(name: "Kim", age: 30, socialSecurityNumber: "999999-1111111", residence: "경기도", money: 200000)

let misterLee = Person(personInformation: personInformationMisterLee, personBody: personBodyMisterLee, personAct: personActMisterLee)
let missKim = Person(personInformation: personInformationMissKim, personBody: personBodyMissKim, personAct: personActMissKim)
let yagombucks = CoffeeShop(cafeName: "yagombucks", barista: misterLee)

yagombucks.playCoffeeShopGame(customerPlayer: missKim, coffeeShop: yagombucks)
