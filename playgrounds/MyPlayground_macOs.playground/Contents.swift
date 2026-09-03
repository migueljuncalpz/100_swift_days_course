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
