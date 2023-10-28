//
//  Buttons.swift
//  Project1
//
//  Created by Sai Pe Pu on 15/10/2566 BE.
//

import SwiftUI

struct Buttons: View {
    @State private var showingAlert = false
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
//      VStack {
//            Button("Delete selection", action: executeDelete)
//                .buttonStyle(.bordered)
//            Button("Button was tapped") { print("Tapped") }
//            Button {
//                print("Button was tapped")
//            } label: {
//                Text("Tap me!")
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.blue)
//            }.cornerRadius(10)
//            Button {
//                print("Edit")
//            } label: {
//                Image(systemName: "pencil")
//                    .padding()
//            }
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Label("Edit", systemImage: "pencil")
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.blue)
//            }.cornerRadius(10)
//            Button("Show Alert") {
//                showingAlert = true
//            }
//            .alert("Important message", isPresented: $showingAlert) {
//                Button("Cancel", role: .cancel) { }
//                Button("Delete", role: .destructive) { }
//            } message: {
//                Text("Please read this.")
//            }
//
//        }
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.2),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.9)
            ], center: .bottom, startRadius: 20, endRadius: 500)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { i in
                        Button {
                            flagTapped(i)
                        } label: {
                            Image(countries[i])
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .cornerRadius(20)
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        print("Flag \(number) is tapped.")
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        print(scoreTitle)
        showingScore = true
    }
    
    func executeDelete() {
        print("Deleting....")
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
