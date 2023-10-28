//
//  Project8.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct Project8: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let Grid = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        return NavigationView {
            ScrollView {
                LazyVGrid(columns: Grid) {
                    ForEach(missions) { mission in
                        NavigationLink {
//                            MissionView(mission: mission, astronauts: astronauts)
                            MissionView2(mission: mission)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
            .background(.darkBackground)
        }
    }
}

struct Project8_Previews: PreviewProvider {
    static var previews: some View {
        Project8()
    }
}
