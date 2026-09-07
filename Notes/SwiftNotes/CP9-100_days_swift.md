## How to handle missing data with optionals
```swift
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let name: String = "Luigi"

if let nameoposite = opposites["\(name)"] {
    print("\(name)'s opposite is \(nameoposite)")
}


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

number  = 10

//will cause a failure
//print(square(number: number))

// this is the way to use the unwrapped value
if let unwrappednumber = number {
    square(number: unwrappednumber)
}
```

## How to unwrap optionals with guard
```swift
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}
```
So: use if let to unwrap optionals so you can process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise.

## 

```swift
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// nil value
let new = captains["Serenity"]

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// nil value
let new = captains["Serenity"] ?? "N/A"
```
Or perhaps you have a struct with an optional property, and want to provide a sensible default for when it’s missing:
```swift
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

```
we can use it to handle a cast an input value
```swift
let input = ""
let number = Int(input) ?? 0
print(number
```

## How to handle multiple optionals using optional chaining

```swift
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"

print("Next in line: \(chosen)")

//Using with structs
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)
```
## How to handle function failure with optionals
```swift
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
```
## Checkpoint 9

Now that you understand a little about optionals, it’s time to pause for a few minutes and try a small coding challenge so you can see how much you’ve remembered.

Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.

I’ll provide some hints in a moment, but first I recommend you go ahead and try it yourself.

```swift
func getRandom(_ integers: [Int]?) -> Int {
    return integers?.randomElement() ?? Int.random(in: 1...100)
}
```
