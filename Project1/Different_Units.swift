//
//  Different_Units.swift
//  Project1
//
//  Created by Sai Pe Pu on 14/10/2566 BE.
//

import SwiftUI


struct Different_Units: View {
    @State private var meter: Double = 0
    @State private var unit: String = "centimeter"
    @State private var Units: Array = ["centimeter", "inches", "km", "miles"]

    
    var converted: Double {
        let u = unit
        var c: Double
        switch u {
        case "centimeter":
            c = meter * 100
        case "inches":
            c = meter * 39.37
        case "km":
            c = meter / 1000
        case "miles":
            c = meter / 1609
        default:
            c = meter
        }
        return c
    }
    
    
    var body: some View {
        Form {
            Section {
                TextField("Meter", value: $meter, format: .number)
                Picker("\(converted)", selection: $unit) {
                    ForEach(Units, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        }
    }
}

struct Different_Units_Previews: PreviewProvider {
    static var previews: some View {
        Different_Units()
    }
}
