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
    var eyes: Int { get }
    var nose: Int { get }
    var mouse: Int { get }
    var ears: Int { get }
    var arms: Int { get }
    var hands: Int { get }
    var legs: Int { get }
    var feet: Int { get }
    
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
    var breakEyes: Int = 0
    var breakEars: Int = 0
    var breakArms: Int = 0
    var breakHands: Int = 0
    var breakLegs: Int = 0
    var breakFeet: Int = 0
    var breakNose: Int = 0
    var breakMouse: Int = 0
    
    var eyes: Int {
        get {
            return 2 - breakEyes
        }
    }
    var ears: Int {
        get {
            return 2 - breakEars
        }
    }
    var arms: Int {
        get {
            return 2 - breakArms
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
    var feet: Int {
        get {
            return 2 - breakFeet
        }
    }
    var nose: Int {
        get {
            return 1 - breakNose
        }
    }
    var mouse: Int {
        get {
            return 1 - breakMouse
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
    var phoneNumber: String? = nil
    var job: String? = nil
    var school: String? = nil
    var company: String? = nil
    var money: Int? = nil
}



class Person {
    var personInformation: PersonInformation
    var personBody: PersonBody
    // personInformation, personBody 두 구조체를 외부에서 주입하였습니다.
    // 변수로 선언한 이유는 구조체는 '값 타입'이므로 'Stack'에 저장되므로, let으로 선언할 경우 내부 프로퍼티의 값을 변경할 수 없기에
    // var로 선언하였습니다!
    // personBody구조체를 상위 프로토콜 타입을 만들어 사용한 이유는 '의존성 주입'때문입니다.
    // 이를 통해, 구조체의 프로퍼티, 메소드가 변경되거나 제거될 경우,
    // Person 클래스의 인스턴스에서 에러가 발생하는 것이 아닌, 프로토콜 타입의 구조체 인스턴스에서 에러가 발생하니,
    // 어느 부분에서 에러가 발생한지 명확하게 파악할 수 있습니다.
    
    // personInformation의 프로토콜을 만들지 않은 이유는 프로토콜로 상위 타입을 만들 수 없다고 생각했기 때문입니다.
    // 동물 -> 사람의 관계를 '상위' '하위 관계로 생각해보았을때.
    // 동물은 정보를 가질 수야 있지만, 사람처럼 '정보'를 꼭 가지고 있지는 않다고 생각하여
    // personInformation은 구조체만 선언하였습니다.
    
    private let personAct: PersonAct
    // personAct 구조체 역시 외부에서 주입하였습니다.
    // personAct구조체를 상위 프로토콜 타입을 만들어 사용한 이유는 '의존성 주입'때문입니다.
    // 이를 통해, 구조체의 프로퍼티, 메소드가 변경되거나 제거될 경우,
    // Person 클래스의 인스턴스에서 에러가 발생하는 것이 아닌, 프로토콜 타입의 구조체 인스턴스에서 에러가 발생하니,
    // 어느 부분에서 에러가 발생한지 명확하게 파악할 수 있습니다.
    
    
    
    init(personInformation: PersonInformation, personBody: PersonBody, personAct: PersonAct) {
        self.personInformation = personInformation
        self.personBody = personBody
        self.personAct = personAct
    }
    // 생성자는 모두 외부에서 구조체의 인스턴스를 주입하는 방식으로 짜보았습니다.
    // 이를 통해, 1. 매개변수의 갯수를 줄일 수 있다. 2. 분기문을 제거하였다. 3. 코드의 간결성이 높아진다. 를 생각하여 작성해 보았습니다.
    
    
    deinit {
        print("\(self.personInformation.name)이 사망하셨습니다.")
            }
    
    func see() {
        if self.personBody.eyes > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.see()
        } else {
            print("\(self.personInformation.name)이 보지 못합니다.")
        }
        
    }
    
    func breath() {
        if self.personBody.nose > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.breath()
        } else {
            print("\(self.personInformation.name)이 숨을 쉬지 못합니다.")
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
    
    func eat() {
        if self.personBody.mouse > 0 {
            print(self.personInformation.name, terminator: "")
            self.personAct.eat()
        } else {
            print("\(self.personInformation.name)이 먹지 못합니다.")
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

class CoffeeCustomer: Person {
    func buy(to things: [String: Int], _ thingsName: String) {
        guard let things = things[thingsName], var money = self.personInformation.money else {
            print("물건이 없습니다.")
            return
        }
        print("\(self.personInformation.name)이 \(thingsName)을(를) 구매하였습니다!")
        money -= things
        self.personInformation.money = money
        print("현재 \(self.personInformation.name)이 보유한 돈은 \(money))입니다.")
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
        
        static let coffeeList = [americano, caffeeLatte, caffeMocha, cappuccino, caramelMacchiato, espresso, hazlnutLatte, vienna]
    }
    
    var cafeName: String
    var barista: Person
    
    
    
    var counterPosMachineMoney = 0
    var salesMoney = 100000
    var menu: [Coffee: String] = [:]
    var pickUpTable: [String: Int] = [:]

    // 카페의 물건들은 setCafeObject 메소드를 이용해 초기화를 하는 방법으로 작성해보았습니다.
    // lazy(지연 저장 프로퍼티)를 통해 카페의 물건을 세팅할 시점에 저장 프로퍼티 값을 초기화하도록 하였습니다.
    // 중요: lazy 키워드는 생성자에서 초기화 하지 않기 때문에 선언 시점에 기본값을 저장해주어야 합니다.
    lazy var coffeeMachine: String = ""
    lazy var table: Int = 0
    lazy var chair: Int = 0
    lazy var cup: Int = 0
    lazy var straw: Int = 0
    
    init(cafeName: String) {
        self.cafeName = cafeName
    }
    
    func setCafeObject() {
        print("\(self.cafeName)카페의 물건들을 세팅해봅시다!")
        
        print("커피 머신 브랜드:", terminator: " ")
        let coffeeMachineSelect = readLine()
        if let coffeeMachineSelect = coffeeMachineSelect {
            self.coffeeMachine = coffeeMachineSelect
        }
        
        print("책상 갯수:", terminator: " ")
        let tableSelect = readLine()
        if let tableSelect = tableSelect {
            let tableInteger = Int(tableSelect)
            if let tableInteger = tableInteger {
                self.table = tableInteger
            }
        }
        
        print("의자 갯수:", terminator: " ")
        let chairSelect = readLine()
        if let chairSelect = chairSelect {
            let chairInteger = Int(chairSelect)
            if let chairInteger = chairInteger {
                self.chair = chairInteger
            }
        }
        
        print("컵 갯수:", terminator: " ")
        let cupSelect = readLine()
        if let cupSelect = cupSelect {
            let cupInteger = Int(cupSelect)
            if let cupInteger = cupInteger {
                self.cup = cupInteger
            }
        }
        
        print("빨대 갯수:", terminator: " ")
        let strawSelect = readLine()
        if let strawSelect = strawSelect {
            let strawInteger = Int(strawSelect)
            if let strawInteger = strawInteger {
                self.straw = strawInteger
            }
        }
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


var personBody = PersonBody(height: 175, weight: 50)



/*
var misterLee = Person(socialSecurityNumber: "999999-1111111", name: "misterLee", age: 24, residence: "서울", phoneNumber: "010-1234-5678", height: 170.5, weight: 80.3, money: 100000)
var missKim = Person(socialSecurityNumber: "999999-4444444", name: "missKim", age: 20, residence: "경기도", phoneNumber: "010-5678-1234", height: 161.3, weight: 50.2, money: 100000)
var yagombucks = CoffeeShop(cafeName: "yagombucks")

yagombucks.playCoffeeShopGame(misterLee, missKim, yagombucks)
*/
