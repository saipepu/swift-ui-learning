//
//  Animation.swift
//  Project1
//
//  Created by Sai Pe Pu on 19/10/2566 BE.
//

import SwiftUI

struct Animation: View {
    @State private var animationAmount = 1.0
    @State private var rotateAmount = 0.0
    @State private var animated = 2.0
    
    
    var body: some View {
        print(animationAmount)
        return VStack(spacing: 50) {
            Button("Tap Me") {
    //            animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red, lineWidth: 1)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount)
            )
            .onAppear {
                animationAmount = 2
            }
            
            Text("Animation")
                .frame(width: 100, height: 50)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animated
                )

            Button("Tap Me") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    rotateAmount += 360
                }
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotateAmount), axis: (x: 0, y: 1, z: 0))
            .overlay(
                Circle()
                    .stroke(.blue)
            )
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
