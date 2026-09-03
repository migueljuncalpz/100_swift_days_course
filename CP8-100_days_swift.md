## How to create and use protocols
the protocols establish contract for classes, structs and enums
```swift 
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

class Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("Driving \(distance) km")
    }
}
struct Bike: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    
    func travel(distance: Int) {
        print("Driving \(distance) km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
let bike = Bike()
commute(distance: 1000, using: bike)
```

## How to use opaque return types

```swift
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}
```
## How to create and use extensions
Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.
```swift

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", 
pageCount:178, readingHours: 24)


//This let us to add a new Constructor
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let lotr2 = Book(title: "Lord of the Rings", pageCount:1178)

```

## How to create and use protocol extensions

```swift

// protocol define
protocol Person {
    var name: String { get }
    func sayHello()
}
// protocol Extension
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
```
## How to get the most from protocol extensions
```swift
extension Int {
    func squared() -> Int {
        self * self
    }
}
let doubleNumber: Double = 5
let wholeNumber = 5
print(wholeNumber.squared())
// print(doubleNumber.squared()) will fail


// with this extension we can remove the Int extension
extension Numeric {
    func squared() -> Self {
        self * self
    }
}
print(doubleNumber.squared())
```
## Checkpoint 8
Now that you understand how protocols and extensions work, it’s time to pause our learning and take on a challenge so you can put it all into practice.

Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

- A property storing how many rooms it has.
- A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
- A property storing the name of the estate agent responsible for selling the building.
- A method for printing the sales summary of the building, describing what it is along with its other properties.

```swift
//Solution
protocol Building {
    var stateAgentName: String { get set}
    var roomsNumber: Int { get }
    var price: Int { get set }
    func printInfo()
}

extension Building {
    func printInfo() {
        print("\(String(describing: Self.self)) \(roomsNumber) rooms, \(stateAgentName), \(price) dollars")
    }
}

struct House: Building {
    let roomsNumber: Int
    var stateAgentName: String
    var price: Int
}

struct Office: Building {
    let roomsNumber: Int = 1
    var stateAgentName: String
    var price: Int
}

let house = House(roomsNumber: 3, stateAgentName: "John", price: 1000000)
let office = Office(stateAgentName: "John", price: 1000000)

house.printInfo()
office.printInfo()

```
