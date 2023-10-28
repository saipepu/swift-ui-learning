//
//  MissionView2.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct MissionView2: View {
    var mission: Mission
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("\(mission.description)")
                        .padding()
                    ForEach(mission.crew, id: \.self) {crew in
                        NavigationLink {
//                            Text("Astronaut \(crew.name)")
                            AstronautView( astronaut: "\(crew.name)")
                        } label: {
                            HStack {
                                Image(crew.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 50)
                                VStack(alignment: .leading) {
                                    Text(crew.name)
                                    Text(crew.role)
                                }
                            }
                        }
                    }
                }
            }
        }

    }
    init(mission: Mission) {
        self.mission = mission
    }
}

struct MissionView2_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView2(mission: missions[0])
    }
}
