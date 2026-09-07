# WeSplit app
in this first app we will learn how to create a form

## Creating a form

```swift
Form {
    //part 1
    Section {
        Text("Hello, world!")
    }

    //part 2
    Section {
        Text("Hello, world!")
        Text("Hello, world!")
    }
}
```

## Adding a navigation bar

```swift
struct ContentView: View {
    var body: some View {
        // this must to be added to naviigationTitle be shown
        NavigationStack{
            Form{
                Text("Hello, World!")
            }.navigationTitle("Home") //also this
        }
    }
}
```

## Modifying program state (IMPORTANTE)
You see, ContentView is a struct, which might be created as a constant. If you think back to when you learned about structs, that means it’s immutable – we can’t change its values freely.

When creating struct methods that want to change properties, we need to add the mutating keyword: mutating func doSomeWork(), for example. However, Swift doesn’t let us make mutating computed properties, which means we can’t write mutating var body: some View – it just isn’t allowed

Fortunately, Swift gives us a special solution called a property wrapper: a special attribute we can place before our properties that effectively gives them super-powers. In the case of storing simple program state like the number of times a button was tapped, we can use a property wrapper from SwiftUI called @State, like this:

Apple recommends we add private access control to those properties, like this: @State private var tapCount = 0.
```swift
import SwiftUI

struct ContentView: View {
    //Using property wrapper to make it mutable
    @State private var tapCount: Int = 0
    
    var body: some View {
        NavigationStack{

            Form {
                Text("Hello, World!")
            }.navigationTitle("Home")
            
            Button("TAP COUNT: \(tapCount)"){
                tapCount += 1
            }
        }
    }
}

#Preview {
    ContentView()
}

```

## Binding state to user interface controls

This is what’s called a two-way binding: we bind the text field so that it shows the value of our property, but we also bind it so that any changes to the text field also update the property.
```swift
       NavigationStack{
            Form {
                // two way binding adding $
                TextField("Enter your name", text: $name);
                Text("Your name is \(name)")
            }.navigationTitle("Home")
            
        }
```

## Creating views in a loop

```swift
            Form {
                TextField("Name", text: $name)
                ForEach(0..<4) {
                    // for each loop
                    index in
                    Text("\(name)\(index)")
                }
            }

            Form {
                TextField("Name", text: $name)
                ForEach(0..<4) {
                    //same for each loop
                    Text("\(name)\($0))")
                }
            }

            //for each really useful for pickers
        
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                Text("You choose : \(selectedStudent)")
            }
```
