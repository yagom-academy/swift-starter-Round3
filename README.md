# Week3 [Step2] BaDook2.     
          
<br>.     
-------BusinessDesign 파일------       
todo 리스트에 "주문과 동시에 missKim의 돈은 커피의 가격만큼 줄어들고, yagombucks의 매출액은 커피 가격만큼 증가합니다."라는 조건이 있기에       
값을 참조학 위해서는 구조체보다는 클래스가 훨씬 수월하기 때문에 전부 클래스로 바꾸어주었습니다.      
12 - buyCoffee함수를 이름만 order함수로 바꾸었습니다.       
18 - 매출액인 sales는 주문양에 따라 더해지기 때문에 임의로 0을 넣어주었습니다.       
19 - 이후에 선언한 메서드에서 사용하기 위해서 고객이라는 Perosn 타입을 추가했습니다.      
29 - takeOrder 메서드에서 consumer, coffe, barista로 인자를 받습니다. 굳이 barista를 인자로 받을 이유는 없으나    
    makeCoffee 메서드 내부 넣기 위해 인자로 받았습니다.      
30 - menu[coffee]를 옵셔널 바인딩하여 고객의 돈이 적냐 많냐에 따라 if문으로 나누었습니다.     
31 ~ 32 - 고객의 돈이 가격에 못미치면 "잔액이 부족합니다."를 출력하      
33 ~ 37 - 그 외에는 "고객이 커피를 주문했다."를 출력하는 consumer.order(coffee)를 호출하고      
         고객의 돈을 가격만큼 빼고 매출에 더해주는 연산을 해줍니다.            
         이후에 makeCoffee 메서드를 호출합니다.        
42 - makeCoffee 함수에서 사실 barista는 굳이 인잘 안받아도 되지만 선언해준게 아까워서 43번째 줄에 출력했습니다.       
44 - 커피가 만들어졌으므로 pickUpTable에 coffee를 넣어줍니다.                     
45 - 픽업대에 가져가달라고 출력합니다.       
49 - 커피를 열거형으로 선언해줍니다. (달라진거. 없습니당).       
       
<br>                          
---------main 파일-----------                                               
3 - misKim을 Person 타입으로 선언하여 name과 money에 임의의 값을 넣어줍니다.                         
4 - misterLee 역시 임의의 값을 넣어줍니다. 이 때 misterLee는 바리스타이므로 money 값은 0을 넣어줬습니다.                                        
5 - yagomBucks를 CoffeeShop 타입으로 선언하여 고객은 missKim. 바리스타는 misterLee로 넣어줍니다.                                     
7 - 모든 출력 메서드를 모아놓은 CoffeeShop.takeOrder를 호출합니다.                                          
