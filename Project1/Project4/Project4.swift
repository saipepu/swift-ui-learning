//
//  Project4.swift
//  Project1
//
//  Created by Sai Pe Pu on 17/10/2566 BE.
//
import CoreML
import SwiftUI

struct Project4: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    Spacer()
                    DatePickerView(selection: $wakeUp)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                    ForEach(0..<20) { cup in
                        Text("\(cup)")
                    }
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
    struct DatePickerView: View {
        @Binding var selection: Date
        
        var body: some View {
            DatePicker("Please enter a time", selection: $selection, displayedComponents: .hourAndMinute)
                .labelsHidden()
        }
    }
    
}

struct Project4_Previews: PreviewProvider {
    static var previews: some View {
        Project4()
    }
}
