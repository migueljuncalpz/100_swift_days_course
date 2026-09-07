//
//  ContentView.swift
//  WeSplit
//
//  Created by Miguel Juncal Paz on 07/09/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var checkAmountWithTips = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var totalCheckAmountWithTips: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    let tipPercentages = [3, 5, 10, 20, 35, 0]

    var body: some View {
        NavigationStack {
            Form {
                Section("How much money did you spend?"){
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .focused($amountIsFocused)
                }
                Section("How many people are splitting the bill?"){
                    Picker("Number of People",selection: $numberOfPeople){
                        ForEach(2..<100) { number in
                            Text("\(number)")
                                .tag(number)
                                
                        }
                    }.pickerStyle(.wheel).frame(height: 120)
                        .clipped()
                    
                }
                Section("Please select the tip percentage"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) { number in
                            Text(number,format: .percent)
                                .tag(number)
                                
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section ("Total ammount with tip \(numberOfPeople)"){
                    Text(totalCheckAmountWithTips,
                         format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section ("Amount per person spare \(numberOfPeople)"){
                    Text(totalPerPerson,
                         format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }.navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
