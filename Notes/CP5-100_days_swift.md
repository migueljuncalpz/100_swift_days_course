## How to create and use closures

```swift
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

let numbers = [5, 2, 8, 1]

let ascending = numbers.sorted {
    $0 < $1
}

// Sort example
let names = ["Ana", "Carlos", "Beatriz", "David", "Ana"]
names.sorted { $0 < $1 }names.sorted { $0 < $1 }

// Filter example
let adults = ages.filter { $0 >= 18 }

// transform elements
let doubles = numbers.map { $0 * 2 }

// execute code in buttons actions
Button("Guardar") {
    saveData()
}
//call some login in a funtion define before
downloadData {
    print("Descarga terminada")
}



```
## How to use trailing closures and shorthand syntax
 
 Trailing closure its a closure that is written after the function parenthesis

```swift
//sorted() can accept any kind of function to do custom sorting
let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

func descargar(completion: () -> Void) {
    print("Descargando...")
    completion()
}
// with no trailing closures
descargar(completion: {
    print("Descarga terminada")
})
// WITH trailing closures
descargar {
    print("Descarga terminada")
}

//Another example using traling closures in arrays
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
```

## How to accept functions as parameters


```swift
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

//we can define the function before

var randomNumber : () -> Int = {
    Int.random(in: 0...20)
}

print(makeArray(size: 6, using: randomNumber))

//complex example
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

//Added the 
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
```

## Checkpoint 5

Two ways to do it

```swift
//first solution
func doImportantWork(luckyNumbers:[Int]) {
    
    var luckyNumbers: [Int] = luckyNumbers
    
    print("JOB 1: Filter Even numbers")
    luckyNumbers = luckyNumbers.filter({!$0.isMultiple(of: 2)})
    print(luckyNumbers)
    
    print("\nJob 2: sort ascendent")
    luckyNumbers = luckyNumbers.sorted(by:{$0 < $1})
    print(luckyNumbers)
    
    print("\n Job 3: print them")
    luckyNumbers.map({print("\($0) is your lucky number")})
}
//Second solution
func doImportantWork(luckyNumbers:[Int], filter: ([Int]) -> [Int], sort:([Int]) -> [Int], map:([Int])-> Void) {
    
    var luckyNumbers: [Int] = luckyNumbers
    
    print("JOB 1: Filter Even numbers")
    luckyNumbers = filter(luckyNumbers)
    print(luckyNumbers)
    
    print("\nJob 2: sort ascendent")
    luckyNumbers = sort(luckyNumbers)
    print(luckyNumbers)
    
    print("\n Job 3: print them")
    map(luckyNumbers)
}



let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


doImportantWork(
    luckyNumbers: luckyNumbers,
    filter: { numbers in
        numbers.filter { !$0.isMultiple(of: 2) }
    },
    sort: { numbers in
        numbers.sorted { $0 < $1 }
    },
    map: { numbers in
        numbers.map { print("\($0) is your lucky number") }
    }
)
```



