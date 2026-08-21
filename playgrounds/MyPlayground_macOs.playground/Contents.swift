import Cocoa

//Structs sit at the core of every SwiftUI app, so it’s really important you take some extra time to make sure you understand what they do and how they work.

//To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

//As always I’ll write some hints below, but first I’m going to leave some space so you don’t see the hints by accident. As always, it’s a really good idea to try this challenge yourself before looking at the hints – it’s the fastest way to identify parts you feel less confident with.


struct Car {
    let model: String
    let numSeats: Int
    let numGears: Int
    
    init(model: String, numSeats: Int, numGears: Int) {
        self.model = model
        self.numSeats = numSeats
        self.numGears = numGears
    }
    
    private var currentGear: Int = 1 {
        didSet {
            print("Gear changed to: \(currentGear) from \(oldValue)")
        }
    }
    mutating func shiftGear(to gear: Int) {
        if gear > numGears  || gear < 1{
            print("Can't shift to gear \(gear)")
            return
        }
        currentGear = gear
    }
    
    func getCurrentGear() -> Int {
        return currentGear
    }
}


var car = Car(model: "Tesla", numSeats: 5, numGears: 8)
car.shiftGear(to: 2)
car.shiftGear(to: 6)
car.shiftGear(to: 0)

print(car.getCurrentGear())
