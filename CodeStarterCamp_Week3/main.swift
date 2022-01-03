var misterLee = Person(name: "misterLee", gender: .male)
var missKim = Person(name:"missKim", gender: .female, money: 50000)
var yagombucks = CoffeeShop(barista: misterLee)

missKim.orderCoffeeFromShop(coffee: .chocolateLatte, from: yagombucks)
