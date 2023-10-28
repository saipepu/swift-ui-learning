//
//  Project6.swift
//  Project1
//
//  Created by Sai Pe Pu on 23/10/2566 BE.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    let fade: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .opacity(fade)
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .bottomLeading, fade: 0), identity: CornerRotateModifier(amount: 0, anchor: .center, fade: 1))
    }
}

struct Project6: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 100, height: 100)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct Project6_Previews: PreviewProvider {
    static var previews: some View {
        Project6()
    }
}
