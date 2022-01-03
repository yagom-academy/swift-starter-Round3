코드 스타터 캠프 3주차 미션을 위한 저장소입니다.


# Class

- 객체를 만들어 내기 위한 설계도 혹은 틀
- 연관되어 있는 프로퍼티와 메서드의 집합

### Object
- 클래스에 선언된 모양 그대로 생성된 실체....
- 클래스의 인스턴스라고도 부르며, 모든 인스턴스를 대표하는 포괄적인 의미를 갖는다.
- OOP의 관점에서 클래스 타입으로 선언 되었을 때 객체라고 부른다

### Instance
- 설계도를 바탕으로 소프트웨어에 구현된 구체적 실체
- 객체를 소프트웨어에 실체화 하면 인스턴스라 부르며, 실체화된 인스턴스는 메모리에 할당된다.

```swift
class Student {
    var name : String = "unKnown"
    var `class` : String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce(){
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()  // result = 학생 타입 입니다.

var student1 : Student // 객체?
student1 = Student() // 인스턴스?

var student: Student = Student()
student.name = "Jessi"
student.class = "iOS"
student.selfIntroduce() // result = 저는 iOS반 Jessi입니다.
```

## 접근 제어자

- open, public
    - open -> 다른 모듈에서 subclass가 가능
- internal - default접근 제어자. entity가 작성된 module에서만 접근 가능
- fileprivate
- private

### initialization

```swift
class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class Food1 {
    var name: String
    
    init() {
        self.name = "[Unnamed]"
    }
    
    convenience init(name:String) {
        self.init()
        self.name = name
    }
}
```

---

# Struct

- 상속안됨
- 생성자를 작성하지 않아도 initializer 제공
- stack에 할당 (class는 heap)
- struct는 값 타입으로 다른 변수에 값을 주면 값을 복사함
- class는 참조 타입으로 복사를 하는게 아니라 기존의 같은 인스턴스에 참조가 사용된다.

### 구조체로 생성할 때
- 구조체의 최우선 목표는 몇몇 단순 데이터 값을 캡슐화 하는 경우
- 캡슐화된 값이 그 구조체의 인스턴스가 할당되거나 넘겨질 때 참조보다 복사하는 것일 경우
- 구조체에 저장되는 값 속성이 참조보다 복사가 예상되는 값 타입인 경우
- 다른 기존 타입에서 기능이나 속성이 상속될 필요가 없는 경우
- 불변성(Immutable)이 필요한 데이터 타입
- 적은 데이터, 즉 멤버 프로퍼티의 갯수나 차지하는 메모리 용량이 적은 타입
- 대입 보다는 생성되는 경우가 많은 타입
- 공유될 필요가 없는 타입
- 클래스 타입 등 레퍼런스에 기반한 자료형을 저장용 프로퍼티로 쓰지 않는 경우

### 구조체가 포함하면 좋은 속성 예제.
- Double 타입인 width 속성과 height 속성을 캡슐화하는 기하학 모형의 크기
- Int 타입인 start 속성과 length 속성을 캡슐화하는 시리즈의 범위를 참조하는 방법
- Double 타입인 x, y와 z 속성을 캡슐화하는 3D 좌표 시스템.

---

# struct & class

### 공통점
- 값을 저장하기 위해 프로퍼티를 정의할 수 있다.
- 기능 실행을 위해 매서드를 정의할 수 있다.
- 서브스크립트 문법을 통해 구조체 또는 클래스가 갖는 값에 접근하도록 서브스크립트를 정의할 수 있다.
- 초기화 될때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있다
- 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있다.
- 특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 있다.

### 차이점
- 구조체는 상속 불가
- 타입캐스팅은 클래스의 인스턴스에만 허용
- 디이니셜라이저는 클래스의 인스턴스에만 가능
- 참조 횟수 계산도 클래스의 인스턴스만

→ 왜냐면 구조체는 값타입 클래스는 참조타입~~

---

# 상속 (inheritance)

상속은 수직확장 extension은 수평확장 

상속은 기존 클래스의 기능을 재정의 가능하나 extension은 불가

상속은 클래스만 가능

기존의 클래스에 기능을 추가하거나 재정의하여 새로운 클래스를 정의하는 것

- 기존에 작성된 클래스를 재활용 할 수 있다
- subClass 설계 시 중복되는 멤버를 미리 부모클래스에 작성해 놓으면 자식 클래스에서는 해당 멤버를 작성하지 않아도 된다
- 클래스 간의 계층적 관계를 구성함으로써 다형성의 문법적 토대를 마련합니다.

---

# Property

- Stored Properties

저장 프로퍼티는 클래스 혹은 구조체의 인스턴스와 연관된 값을 저장하는 프로퍼티로 기본값과 초깃값을 지정할 수 있다.  
  
구조체의 저장 프로퍼티가 옵셔널이 아니더라도 저장 프로퍼티를 모두 포함하는 이니셜라이저를 자동 생성

클래스는 옵셔널이 아니라면 기본값을 지정하거나 사용자 정의 이니셜라이저를 통해 반드시 초기화 해야함.

클래스 인스턴스의 상수 프로퍼티는 초기화 될 때 한번만 값을 할당할 수 있고 자식클래스에서는 이 초기화를 재정의 할 수 없다... 
    
     
- Computed Properties

연산 프로퍼티는 특정 상태에 따른 값을 연산(get / set)

인스턴스 외부에서 메서드를 통해 내부값에 접근하려면 getter, setter 2개의 메서드를 구현해야하며, 구현한다해도 두 메서드가 분산 구현되기 때문에 코드의 가독성이 나빠짐...
    
```swift
struct Point{
    var x: Int
    var y: Int

    var oppositePoint:Point{
        get{
            Point(x: -x, y: -y)
        }
        set{
            x = -newValue.x
            y = -newValue.y
        }
    }
}
```
    

- Type Properties

    각각의 인스턴스가 아닌 타입 자체에 속하는 프로퍼티... (like static)


---

# Method
특정 타입에 관련된 함수

- 인스턴스 메서드
    
    자신의 프로퍼티 값을 수정할 때 구조체나 열거형 등은 메서드 앞에 mutating키워드를 붙여 해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야함
    
- 타입 메서드
    
    메서드 앞에 static / class 키워드를 사용
    
    static : 상속 후 메서드 재정의 불가
    
    class : 상속 후에도 재정의 가능
