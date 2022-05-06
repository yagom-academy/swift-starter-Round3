# 커피숍 주문하기

## 👥 Person 만들기
1. 구조체를 선택한 이유
- 사람이라는 특성을 생각하여 선택했다. A와 B라는 사람이 일란성 쌍둥이거나, 도플갱어라고 가정했을 때, 둘의 특성과 하는 동작이 같아도 다른 사람이다. A가 C가 된다고 해서 B가 C가 되지 않는다.  
_즉, 속성이나 동작을 복사했을 뿐, 이후 변경사항이 생겼을 때 상호작용하지 않기 때문에 값타입으로 설정하였다._
2. pastime에 옵셔널을 사용한 이유
- 여가시간이 없을 수도 있고, 있어도 어떤 활동을 할지 못 정했을 수도 있으니까.
- 그래서 `enjoyLeisureTime`함수에서 옵셔널을 제거하는 `if let`을 써주고 여가시간을 즐기는 버전과  
여가시간을 즐기지 않는 버전을 작성하였다.

## ☕️ 카페차리기
1. 클래스타입으로 선택한 이유
- 카페는 프랜차이즈를 낸다. 본사와 프랜차이즈 간의 상호작용도 존재한다. 때문에 참조타입으로 상속이 가능한 클래스 타입을 선택했다.
2. 바리스타는 카페의 필수요소이기 때문에 암시적 추출 옵셔널로 작성하였다. 
3. 가격에 쉼표로 천단위 구분
```
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let price = price
        let result = numberFormatter.string(for: price)!
        let count : String = "가격은 \(result)원입니다."
```
- `let price = price`해준 이유는 아래 매출 누적연산을 위한 코드`salesRevenue += price`는 `Int` 타입이기 때문이다.
- `NumberFormatter()`은 옵셔널처리를 해주기 때문에 `result`에서 옵셔널을 강제추출해준다.
- `sayTodaySalesRevenue()`에서도 똑같이 쉼표로 천단위를 구분하여 매출을 말하게한다.
4. `salesRevenue += price`은 계산하는 순간 매출로 잡히게 하기위함이다.
