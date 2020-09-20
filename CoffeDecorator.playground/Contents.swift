import UIKit

protocol Coffee {
    var price: Double { get }
}

class SimpleCoffee: Coffee {
    var price: Double = 50
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class Milk: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var price: Double {
        return base.price + 30
    }
}

class Whip: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var price: Double {
        return base.price + 15
    }
}

class Sugar: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var price: Double {
        return base.price + 10
    }
}

let simpleCoffee = SimpleCoffee()
print(String(simpleCoffee.price) + " обычный кофе")
let milkCoffee = Milk(base: simpleCoffee)
print(String(milkCoffee.price) + " кофе с молоком")
let sugarMilkCoffee = Sugar(base: milkCoffee)
print(String(sugarMilkCoffee.price) + " кофе с молоком и сахаром")
