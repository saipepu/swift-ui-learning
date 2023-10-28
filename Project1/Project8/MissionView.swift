//
//  MissionView.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width * 0.5)
                            .padding(.top)
                        
                        VStack(alignment: .leading) {
                            Text("Mission Highlights")
                                .font(.title.bold())
                                .padding(.bottom, 5)
                            Text(mission.description)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(crew, id: \.role) { crewMember in
                                    NavigationLink {
                                        Text("Astronaut details")
                                    } label:  {
                                        HStack {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .frame(width: 104, height: 72)
                                                .clipShape(Capsule())
                                                .overlay(
                                                    Capsule()
                                                        .strokeBorder( .white, lineWidth: 1))
                                            VStack(alignment: .leading) {
                                                Text(crewMember.astronaut.name)
                                                    .foregroundColor(.white)
                                                    .font(.headline)
                                                Text(crewMember.role)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                .navigationTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
                .background(.darkBackground)
            }
        }
    }
        
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map {member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
