/* 신체정보, 개인정보를 구조체로 선언한 이유
1. 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶을 때
2. 자신을 상속할 필요가 없거나, 자신이 다른 타입을 상속받을 필요가 없을 때
 */

/* 사람을 클래스로 선언한 이유
 1. 사람의 공통적인 속성을 프로퍼티, 메소드로 정의 한 후 세부 사람 클래스로 상속하기 위해
 2. 인종, 직업 등으로 사람들 분류해보기 위해
 */
struct PersonalInformation {
    // 주민등록번호
    var socialSecurityNumber = "999999-1111111"
    
    // 이름은 변경 가능하니 String
    var name = "성 이름"
    
    // 나이
    var age = 0
    
    // 거주지
    var residence = "서울"
    
    // 전화번호
    var phoneNumber = "010-0000-0000"
    
    // 학교
    var school: String?
    
    // 직장
    var company: String?
}

struct PhysicalInformation {
    // 키
    var height = 0.0
    // 몸무게
    var weight = 0.0
    // 눈
    var eyes = 2
    // 코
    var nose = true
    // 입
    var mouse = true
    // 귀
    var ears = 2
    // 팔
    var arms = 2
    // 손
    var hands = 2
    // 다리
    var legs = 2
    // 발
    var feet = 2
}


/* 개인 정보, 신체 정보 구조체를 var(변수)로 선언한 이유
 let(상수)로 선언하면 구조체 내부의 멤버 값을 변경할 수 없다.
 */

class Person {
    // 개인 정보
    var personalInformation = PersonalInformation()
    // 신체 정보
    var physicalInformation = PhysicalInformation()
    // 돈
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
    
    init?(socialSecurityNumber: String, name: String, age: Int, residence: String, phoneNumber: String, school: String?, company: String?, height: Double, weight: Double, money: Int) {
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
    func buy(to things: [String: Int], name thingsName: String) {
        guard let things = things[thingsName] else {
            print("물건이 없습니다.")
            return
        }
        print("\(personalInformation.name)이 \(thingsName)을(를) 구매하였습니다!")
        money = money - things
        print("현재 \(personalInformation.name)이 보유한 돈은 \(money)입니다.")
    }
}


var yujun: Person? = Person(socialSecurityNumber: "999999-1234567", name: "서유준", age: 24, residence: "서울", phoneNumber: "010-123405678", height: 175.5, weight: 68.5, money: 10000)

// Test - 사람 동작 메소드
yujun?.see()
yujun?.breath()
yujun?.hear()
yujun?.clap()
yujun?.run()
yujun?.physicalInformation.eyes = 0
yujun?.see()


// Test - buy 메소드
var things: [String: Int] = ["코카콜라": 2000, "칠성사이다": 1500]
yujun?.buy(to: things, name: "칠성사이다")
