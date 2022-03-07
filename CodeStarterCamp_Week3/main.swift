/* 신체정보, 개인정보를 구조체로 선언한 이유
1. 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶을 때
2. 자신을 상속할 필요가 없거나, 자신이 다른 타입을 상속받을 필요가 없을 때
 */

/* 사람을 클래스로 선언한 이유
 1. 사람의 공통적인 속성을 프로퍼티, 메소드로 정의 한 후 세부 사람 클래스로 상속하기 위해
 2. 인종, 직업 등으로 사람들 분류해보기 위해
 */
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
/*
 개인 정보, 신체 정보 구조체를 var(변수)로 선언한 이유
 let(상수)로 선언하면 구조체 내부의 멤버 값을 변경할 수 없다.
 */

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

/*
CoffeeShop 타입을 생성합니다.

세상에는 많은 카페들이 있습니다.
카페들이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
매출액을 속성으로 가질 수 있도록 해봅시다.
메뉴판(커피 종류, 가격)을 가질 수 있도록 해봅시다.
커피를 올려둘 수 있는 pickUpTable을 가질 수 있도록 해봅시다.
카페들이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
주문을 받고, 커피를 만들어낼 수 있는 동작을 가질 수 있도록 해봅시다.
*/

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
    var pos = 0
    
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



}
