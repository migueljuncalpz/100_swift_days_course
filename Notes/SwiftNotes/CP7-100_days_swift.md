## How to create your own classes
Swift uses structs for storing most of its data types, including String, Int, Double, and Array, but there is another way to create custom data types called classes. These have many things in common with structs, but are different in key places.

First, the things that classes and structs have in common include:

You get to create and name them.
You can add properties and methods, including property observers and access control.
You can create custom initializers to configure new instances however you want.
However, classes differ from structs in five key places:

You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
Even if you make a class constant, you can still change its properties as long as they are variables.

```swift

//define a class named Game
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

//Instance a class
var newGame = Game()
newGame.score += 10
```

## How to make one class inherit from another

```swift
//parent class
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    func work(){
        print("I work hard for \(hours) a day")
    }
}

// ineriths from Employee
class Developer: Employee {
    
    override func work(){
        print("I work hard for \(hours) a day")
    }
}

//also ineriths from Employee
class Manager: Employee {
    
    override func work(){
        print("I supervise my employees for \(hours) a day")
    }
}

let manager = Manager(hours: 10)
manager.work()
let developer = Developer(hours: 8)
developer.work()
```

## How to add initializers for classes

```swift
//parent class
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    func work(){
        print("I work hard for \(hours) a day")
    }
}

class Developer: Employee {
    
    var extraOurs:Int
    
    //
    init(extraOurs: Int, hours: Int) {
        self.extraOurs = extraOurs
        super.init(hours: hours)
    }
    override func work() {
        print("I am a developer and I work hard for \(hours) a day")
    }
    
}

let employee1: Employee = Developer(extraOurs: 10, hours: 10)
let employee2: Employee = Employee(hours: 10)

```

## How to copy classes
In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

```swift
import  Cocoa

//parent class
class User {
    var username = "Anonymous"
}

var user = User()
var user2 = user

user2.username = "John"

print(user.username)// John returned

//safe copy
class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
var user = User()
var user2 = user.copy()

user2.username = "John"

print(user.username)//anonymous
```
## How to create a deinitializer for a class.
- Just like initializers, you don’t use func with deinitializers – they are special.
- Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
- Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
- We never call deinitializers directly; they are handled automatically by the system.
- Structs don’t have deinitializers, because you can’t copy them.

```swift
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
```
## How to work with variables inside classes

In cals
```swift 
class User {
    var name = "Paul"

    func changeName(name:String){
        this.name = name
    }
}

let user = User()
user.name = "Taylor"
print(user.name)
```
## Checkpoint 7
Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

But there’s more:

- The Animal class should have a legs integer property that tracks how many legs the animal has.
- The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
- The Cat class should have a matching speak() method, again with each subclass printing something different.

- The Cat class should have an isTame Boolean property, provided using an initializer.


```swift
import  Cocoa

class Animal {
    let legs:Int
    
    init(legs: Int) {
        self.legs = legs
    }
    func speak(){}
}

class Dog: Animal {
    override func speak() {
        print("Woof!")
    }
    init() {
        super.init(legs: 4)
    }
}
class Cat: Animal {
    let isTame: Bool
    override func speak() {
        print("Miau")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof woof! from corgi")
    }
}

class Poddle: Dog {
    override func speak() {
        print("woof wooof from poddle")
    }
}

class Persian: Cat {
    override func speak() {
        print("Miaaau! from pesian")
    }
}

class Lion: Cat {
    override func speak() {
        print("miaaau from Lion")
    }
}


let lion = Lion(isTame: false)
let persian = Persian(isTame: true)

let poodle = Poddle()
let corgi = Corgi()


lion.speak()
persian.speak()
corgi.speak()
poodle.speak()
```