//
//  Colors_Frames.swift
//  Project1
//
//  Created by Sai Pe Pu on 14/10/2566 BE.
//

import SwiftUI

struct Colors_Frames: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LinearGradient(stops: [
                    .init(color: .white, location: 0.05),
                    .init(color: .black, location: 0.55)
                ], startPoint: .top, endPoint: .bottom)
                RadialGradient(colors: [.blue, .black, .gray], center: .bottom, startRadius: 20, endRadius: 400)
            }
            Text("Your content")
                .foregroundStyle(.white)
                .padding(50)
                .background(.red.gradient)
                .cornerRadius(20)
        }
        .ignoresSafeArea()
    }
}

struct Colors_Frames_Previews: PreviewProvider {
    static var previews: some View {
        Colors_Frames()
    }
}
