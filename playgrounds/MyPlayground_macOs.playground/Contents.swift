enum UserError: Error {
    case badID, networkFailed
}

func getRandom(_ integers: [Int]?) -> Int {
    return integers?.randomElement() ?? Int.random(in: 1...100)
}


getRandom([1,2,3,4])
