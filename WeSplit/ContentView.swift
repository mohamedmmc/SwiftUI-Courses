//
//  ContentView.swift
//  WeSplit
//
//  Created by Mohamed Melek Chtourou on 26/1/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var number0fPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amoutIsFocused:Bool
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let peopleCount = Double (number0fPeople + 2)
        let tipSelection = Double (tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount",value: $checkAmount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amoutIsFocused)
                    
                    Picker("Number of people",selection: $number0fPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages,id:\.self){
                            Text($0,format:.percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Tip Percentage")
                }
                Section{
                    Text(totalPerPerson ,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amoutIsFocused.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
