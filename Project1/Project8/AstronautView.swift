//
//  AstronautView.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: String
    let a: Astronaut
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        ScrollView {
            VStack {
                Image(a.id)
                    .resizable()
                    .scaledToFit()
                Text(a.description)
                    .padding()
            }
        }
    }
    init(astronaut: String) {
        self.astronaut = astronaut
        self.a = self.astronauts[self.astronaut]!
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static var previews: some View {
        AstronautView(astronaut: "grissom")
    }
}
