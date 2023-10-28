//
//  SwiftUIView.swift
//  Project1
//
//  Created by Sai Pe Pu on 14/10/2566 BE.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var fahrenheit: Double = 32
    @State private var celsius: Double = 0
    
    var toCelsius: Double {
        let c = (fahrenheit - 32) * (5/9)
        return c
    }
    
    var body: some View {
        Form {
            Section("Fahrenheit") {
                TextField("Fahrenheit: ", value: $fahrenheit, format: .number)
            }
            Section("Celsius") {
                Text("\(toCelsius)")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
