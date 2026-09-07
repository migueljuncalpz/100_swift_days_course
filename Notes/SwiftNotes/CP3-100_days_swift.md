## How to check a condition is true or false

```swift
var someCondition = false

if someCondition {
    print("Hola") //⚠️ Will never be executed
} else {
    print("Adios")
}
// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}
```

## How to use switch statements to check multiple conditions

```swift
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

let day = 5

switch day {
case 5:
    print("5 golden rings")
    fallthrough //makes execute case 4
case 4:
    print("4 calling birds")
    fallthrough//makes execute case 3
case 3:
    print("3 French hens")
    fallthrough//makes execute case 2
case 2:
    print("2 turtle doves")
    fallthrough//makes execute case default
default:
    print("A partridge in a pear tree")
}

```
## How to use the ternary conditional operator for quick tests
```swift
let age = 18

age >= 18 ? print("adult") : print("minor")
//better
print(age >= 18 ? "adult" : "minor")

```

## How to use a for loop to repeat work
```swift
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// from 1 to 5
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

// from 1 to 4
for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}


var lyric = "Haters gonna"
//if you dont wanna use the loop variable you can use underscore (_)
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)
```

## How to skip loop items with break and continue

```swift
//Continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue // start again the loop
    }

    print("Found picture: \(filename)")
}
// Break
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break // stop the loop
        }
    }
}

print(multiples)
```
## Checkpoint 3

**Goal** \
_ whole numbers from 1 to 100 in 3.
- If it’s a multiple of 3, print “Fizz” 
- If it’s a multiple of 5, print “Buzz” 
- If it’s a multiple of 3 and 5, print “FizzBuzz”  
- Otherwise, just print the number.

```Swift
import Cocoa

for i in 1...100{
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    }
    if i.isMultiple(of: 3){
        print("Fizz")
    }
    else if i.isMultiple(of: 5){
        print("Buzz")
    }
    else{
        print(i)
    }
}

```