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

