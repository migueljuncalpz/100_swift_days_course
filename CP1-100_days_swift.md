## How to create variables and constants

### Variables:
````swift
var greetings = "Hello world"

greetings = "Hola mundo"
````
### Constants
````swift
let constant = 3

//constant = 4 will failure
````
If you can, **prefer to use constants rather than variables** – not only does it give Swift the chance to **optimize** your code a little better, but it also allows Swift to make sure you **never change a constant’s value by accident**.

## How to create strings

```swift
let actor = "Denzel Washington"
```
```swift
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
```
quote: *Then he tapped a sign saying "Believe" and walked away* 

```swift
let movie = "A day in
the life of an
Apple engineer"

//this make it failure
```

```swift
let movie = """
A day in
the life of an
Apple engineer
"""

//this is correct
```
movie: \
A day in \
the life of an \
Apple engineer

Count characters:
```swift
print(actor.count)
//result: 17 (characters number)
```
Make uppercased:
```swift
print(actor.uppercased())
//result: DENZEL WASHINGTON 
```
Give a boolean if it contains de string
```swift
print(actor.hasPrefix("Denzel"))
result: true

```
```swift
print(actor.hasSuffix("Denzel"))
result: false

```
**⚠️Warning: case-sensitive⚠️**

## How to store whole numbers

If we were writing that out by hand we’d probably write “100,000,000” at which point it’s clear that the number is 100 million.Swift has something similar: you can use underscores, _, to break up numbers however you want.

Swift doesn’t actually care about the underscores, so if you wanted you could write this instead:
```swift
let score = 10
let reallyBig = 100000000
let reallyBig2 = 100_000_000
let reallyBig3 = 1_00__00___00____00

// gives the same result: 100000000
```

Number operations:
```swift
let lowerScore = score - 2 //subtract
let higherScore = score + 10 //add
let doubledScore = score * 2 //multiply
let squaredScore = score * score //squared
let halvedScore = score / 2 //split
```

Counter:
```swift
var counter = 10
counter = counter + 5
//better option:
counter += 5
// other operations
counter *= 2
counter -= 10
counter /= 2
```

Is multiple:
```swift
let number = 120
print(number.isMultiple(of: 3))
//or
print(120.isMultiple(of: 3))

```


## How to store decimal numbers

```swift
let number = 0.1 + 0.2
print(number)

//this will make failure
//Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
let a = 1
let b = 2.0
let c = a + b

// to make it possible

let c = a + Int(b)
let c = Double(a) + b


//Swift decides whether you wanted to create a Double or an Int based on the number you provide – if there’s a dot in there, you have a Double, otherwise it’s an Int. Yes, even if the numbers after the dot are 0.

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

//Cannot assign value of type 'Int' to type 'String'
var name = "Nicolas Cage"
name = 57

var rating = 5.0
rating *= 2
```


## How to store truth with Booleans

```swift
let goodDogs = true
let gameOver = false

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated) // true
isAuthenticated = !isAuthenticated
print(isAuthenticated) //false

// toggle make boolean change like ! without assign statement
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
```

## How to join strings together

```swift
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart
// greeting: Hello, world!


let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
// lyric : haters gona hate
```
This technique works great for small things, but you wouldn’t want to do it too much. You see, each time Swift sees two strings being joined together using + it has to make a new string out of them before continuing, and if you have lots of things being joined it’s quite wasteful.

Swift has a better solution called **string interpolation**, and it lets us efficiently create strings from other strings, but also from integers, decimal numbers, and more.

```swift
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

//Tip: You can put calculations inside string interpolation if you want to. For example, this will print “5 x 5 is 25”:

print("5 x 5 is \(5 * 5)")


```

## Simple Data summary
We’ve covered a lot about the basics of data in the previous chapters, so let’s recap:

- Swift lets us create constants using let, and variables using var.
- If you don’t intend to change a value, make sure you use let so that Swift can help you avoid mistakes.
- Swift’s strings contain text, from short strings up to whole novels. They work great with emoji and any world language, and have helpful functionality such as count and uppercased().
- You create strings by using double quotes at the start and end, but if you want your string to go over several lines you need to use three double quotes at the start and end.
- Swift calls its whole numbers integers, and they can be positive or negative. They also have helpful functionality, such as isMultiple(of:).
- In Swift decimal numbers are called Double, short for double-length floating-point number. That means they can hold very large numbers if needed, but they also aren’t 100% accurate – you shouldn’t use them when 100% precision is required, such as when dealing with money.
- There are lots of built-in arithmetic operators, such as +, -, *, and /, along with the special compound assignment operators such as += that modify variables directly.
- You can represent a simple true or false state using a Boolean, which can be flipped using the ! operator or by calling toggle().
- String interpolation lets us place constants and variables into our strings in a streamlined, efficient way.

It’s a lot, right? And that’s okay – you’ll be using everything from that list time and time again as you build apps, until eventually you’ll understand it all without needing to refer back here.


## Checkpoint 1:
```swift
import Cocoa

let celsiusTemperature = 36.0
let fahrenheitTemperature = celsiusTemperature * 9.0 / 5.0 + 32.0

print("Celsius value:\(celsiusTemperature) and Fahrenheit value:\(fahrenheitTemperature)")

```




