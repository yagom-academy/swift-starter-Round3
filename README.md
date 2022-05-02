# Week3 [Step2] BaDook2 ver2.     
          
<br>.     
-------BusinessDesign 파일------       
12 - order 메서드에서 coffeeShop을 추가 parameter로 받고 print()를 한 이후에 coffeeShop.takeOrder 메서드를 호출하였습니다.   
30 - takeOrder 메서드에서 딕셔너리 rawValue값이 옵셔널이므로 guard let을 이용합니다. 이 때 guard-let으로 선언한 변수는
     전역변수로 사용 가능하다는 것은 알았지만 이렇게 활용할 줄은 몰랐습니다...
     print("메뉴에 없는 주문입니다.") 이 코드도 처음에 코드를 작성할 때 넣고싶었는데 옵셔널을 다룰 방법을 몰라서 우왕자왕 했었습니다..
40 - 그리고 원래는 Person타입에 order 메서드에 makeCoffee 메서드를 넣어야 할 것 같지만 주문을 성공해야 커피를 만들어야 한다고 생각해서
     takeOrder 메서드에 makeCoffee 메서드를 넣었습니다. 다만 이렇게하면 order 메서드의 용도가 많이 없어서지는 것 같아 잘 활용해보고 싶은데
     어떻게 더 활용할 수 있을지 모르겠습니다.
     그 이후에 코드는 동일합니다.
       
<br>.                          
---------main 파일-----------                                               
main파일 코드도 동일합니다.
