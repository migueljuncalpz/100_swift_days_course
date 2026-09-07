## How to create your own structs

```swift
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//Other example

struct Employee {
    let name: String
    var vacationRemaining = 14 //default value
    // if you want to modify some properties we must use mutating before methods definition
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// we can instance an struct with this code
let employee = Employee(name: "John",vacationRemaining: 24)
let employee = Employee(name: "John") // 14 vacation days

```

## How to compute property values dynamically

```swift
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14) // instance
archer.vacationTaken += 4 // applying logic defined
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)

```

## How to take action when a property changes
```swift 
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

```

## How to create custom initializers
```swift
struct Player {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}
// we can initialize just one properties
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
```
## How to limit access to internal data using access control
```swift
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
```

## Static properties and methods

```swift
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
```


## Checkpoint 6
```swift
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

```
