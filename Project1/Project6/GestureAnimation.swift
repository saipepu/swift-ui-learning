//
//  GestureAnimation.swift
//  Project1
//
//  Created by Sai Pe Pu on 19/10/2566 BE.
//

import SwiftUI

struct GestureAnimation: View {
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    
    var body: some View {
        return LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded {_ in
                        withAnimation {
                            dragAmount = .zero
                        }
                    }
            )
    }
}

struct GestureAnimation_Previews: PreviewProvider {
    static var previews: some View {
        GestureAnimation()
    }
}
