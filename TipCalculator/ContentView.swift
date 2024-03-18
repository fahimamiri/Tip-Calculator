//
//  ContentView.swift
//  TipCalculator
//
//  Created by patron on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State
    var tipParcent: Double = 0.2
    
    //option for tip
    @State var tipChoices: [Double] = [
        0.05, 0.1, 0.15, 0.18, 0.25
    ]
    @State 
    var userInput: String = ""
    @State 
    var output: String = ""
    
    
    //helper function
    func format(percent: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter.string(from: percent as NSNumber) ?? ""
        
       
        
    }
    var body: some View {
        VStack {
            TextField("Amount", text: $userInput)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.gray)
                .keyboardType(.decimalPad)
            Picker("", selection: $tipParcent){
                ForEach(tipChoices, id:\.self) { (percentage: Double) in
                    
                    Text(format(percent: percentage))
                    
                }
            }
            Button("Calculate Tip"){
                //converstion form string to double
               
                if let amount = Double(userInput){
                    let calcultedTip = amount * tipParcent
                    
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .currency
                    
                    output = formatter.string(from: calcultedTip as NSNumber) ?? "coudnot conver value"
                    //output = "$" + String(calcultedTip)
                  
                }
                else{
                    output = "Could not convert values"
                }
                
            }
            .padding(32)
            Text(output)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
