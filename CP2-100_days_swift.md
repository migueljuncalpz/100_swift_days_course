## How to store ordered data in arrays

Arrays starts in 0 position
```swift
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0]) // John
print(numbers[1]) // 8
print(temperatures[2]) // 26.4
```

operations:
```swift
print(beatles.count) //4
beatles.append("Pete") //["John", "Paul", "George", "Ringo", "Pete"]
print(beatles.count) //5

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)//3

characters.removeAll()
print(characters.count)//0
```

You can define the arrays types
```swift
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// there is an other way

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
```

other operations:
```swift
//contains boolean result
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))//false
//Sort
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted()) //["Budapest", "London", "Rome", "Tokyo"]

//reverse
let cities = ["London", "Tokyo", "Rome", "Budapest"]
let reversedCities = cities.sorted().reversed()
print(Array(reversedCities))
```

## How to store and find data in dictionaries

```swift
let employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
print(employee2["name"]) // Optional("Taylor Swift")

print(employee2["password"]) // nil

print(employee2["name", default: "Unknown"]) // Taylor Swift


//overwritable
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

archEnemies["Batman"] = "Penguin" // this overwrite the batman key
print(archEnemies["Batman"]) // optional("Penguin")

//overwritten and appended
var archEnemiesPlus = [String : [String]] ()
archEnemiesPlus["Batman"] = ["The Joker", "Two-Face"]
archEnemiesPlus["Superman"] = ["Lex Luthor"]
archEnemiesPlus["Batman"] = ["Penguin"] // overwrite
archEnemiesPlus["Batman" ,default: []].append("mariño") //append
print(archEnemiesPlus["Batman", default:[]])
```

## How to use sets for fast data lookup

```Swift

//create a Set directly

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
people.insert(1) //fail because is constant and its a string set

// create set and insert after
var games = Set<String>()
games.insert("chinchon") //true
games.insert("chinchon") //false
games.insert("brisca") //true
games.insert("escoba") //true
games.insert(1) // fail because expect a string member
```

Why sets make searches faster??
The *Set* use **hashes** to save items and uses hash value to locate them too 



## How to create and use enums

```Swift
// weekdays enum
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

//weekend enum
enum Weekend {
    case Saturday
    case Sunday

}

// variable of type weekday with value monday
var day = Weekday.monday

day = .friday // value changes to friday

day = Weekend.Saturday // FAIL you are trying to change the type of the variable no the value
```

## How to use type annotations

On Swift  you can also define a type with *type-annotations*
```Swift
let surname: String = "Lasso" //constant of type String
var score: Int = 0 // variable of type Int

var score: Double = 0 //variable type double


//String holds text:
let playerName: String = "Roy"

//Int holds whole numbers:
var luckyNumber: Int = 13

//Double holds decimal numbers:
let pi: Double = 3.141

//Bool holds either true or false:
var isAuthenticated: Bool = true

//Array holds lots of different values, all in the order you add them. This must be specialized, such as [String]:
var albums: [String] = ["Red", "Fearless"]

//Dictionary holds lots of different values, where you get to decide how data should be accessed. This must be specialized, such as [String: Int]:
var user: [String: String] = ["id": "@twostraws"]

//Set holds lots of different values, but stores them in an order that’s optimized for checking what it contains. This must be specialized, such as Set<String>:
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

//Knowing all these types is important for times when you don’t want to provide initial values. For example, this creates an array of strings:
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]

//Type annotation isn’t needed there, because Swift can see you’re assigning an array of strings. However, if you wanted to create an empty array of strings, you’d need to know the type:
var teams: [String] = [String]()
```

## Checkpoint 2

Goal: count the number of the unique game names

```Swift
import Cocoa

let games : [String] = ["escoba", "escoba" ,"brisca", "chinchon"]
print(games.count)
let gamesUnique = Set(games)
print(gamesUnique.count)


```