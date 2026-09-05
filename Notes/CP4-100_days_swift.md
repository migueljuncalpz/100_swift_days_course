## How to reuse code with functions
```swift 

// void function
func letWelcome(Name:String){
    print("hello, \(Name)")
}
//return value function
func letWelcome(Name:String, Surname:String)->String{
    "hello, \(Name)"
}

letWelcome(Name: "Miguel")

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

//parameter name ( External:for | Internal:number )
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)
```

## How to provide default values for parameters
```swift

//default value of 12
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)//end use the default value

//another example of default
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true) //change the false default value
print(characters.count)
```

## How to handle errors in functions
```swift

enum passwordError : Error  {
    case short,obvious
}

// throwing errors
func checkPassword(password:String) throws -> String{
    if password.count < 8 {
        throw passwordError.short
    }
    else if password.contains("password") {
        throw passwordError.obvious
    }
    else {
        "excelent"
    }
}

// catching the errors and managing them
func register(username:String , password:String) ->  Bool{
    do{
        try checkPassword(password: password)
    } catch passwordError.short {
        print("password too short")
        return false
    } catch passwordError.obvious {
        print("password is obvious")
        return false
    } catch {
        print("There was an error.")
        return false
    }
    return true
}

register(username: "miguel", password: "password12313")

```



## Checkpoint 4

With functions under your belt, it’s time to try a little coding challenge. Don’t worry, it’s not that hard, but it might take you a while to think about and come up with something. As always I’ll be giving you some hints if you need them.

The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

- You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
- If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
- You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
- If you can’t find the square root, throw a “no root” error.

```swift
import Cocoa

enum integerSquareRootErrors : Error {
    case notFound, outOfBounds
}

func checkBounds(number:Int) throws {
    if number < 1 || number > 100000 {
        throw integerSquareRootErrors.outOfBounds
    }
}
func findSquareRoot(number:Int) throws -> Int {
    for i in 1...number {
        if i * i == number {
            return i
        }
        if i * i > number {
            throw integerSquareRootErrors.notFound
        }
    }
    throw integerSquareRootErrors.notFound
}

func integerSquareRoot(_ number:Int) {
    do {
        try checkBounds(number: number)
        let result = try findSquareRoot(number: number)
        print("\(number) is a perfect square, the square root is \(result)")
        return
    }catch integerSquareRootErrors.notFound{
        print("\(number) is not a perfect square")
        return
    } catch integerSquareRootErrors.outOfBounds{
        print("Out of bounds")
        return
    } catch {
        print("error")
    }
    
}

integerSquareRoot(100000)
```


