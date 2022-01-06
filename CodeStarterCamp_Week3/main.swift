var misterLee = Person(name: "misterLee", gender: .male)
var missKim = Person(name:"missKim", gender: .female, money: 500)
var yagombucks = CoffeeShop(barista: misterLee)

yagombucks.order(coffee: .chocolateLatte, person: missKim)
