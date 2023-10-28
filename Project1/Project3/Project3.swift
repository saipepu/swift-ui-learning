//
//  Project3.swift
//  Project1
//
//  Created by Sai Pe Pu on 15/10/2566 BE.
//

import SwiftUI

struct Project3: View {
    
//    let motto1 = Text("Never Give Up!")
//    @ViewBuilder var spells: some View {
//        Text("Keep")
//        Text("Going")
//    }
    var countries = ["Italy", "France", "Spain"]
    
    
    var body: some View {
        //        VStack {
        //            Button("Button") {
        //                print(type(of: self.body))
        //            }
        //            motto1.foregroundColor(.gray)
        //            spells.font(.title)
        //
        //            TextCapsule(text: "First")
        //            TextCapsule(text: "Second")
        //                .titleStyle()
        //
        //            Color.blue
        //                .frame(width: 300, height: 200)
        //                .waterMarked(with: "waterMarked")
        //        }
        VStack(alignment: .leading, spacing: 15) {
            ForEach(0..<3) { i in
                HStack(alignment: .center, spacing: 15) {
                    Image(countries[i])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 60)
                        
                    Text("\(countries[i])")
                    Spacer()
                }.RowStyle()
                    .BadgeStyle(with: VStack{ Text("Badge")})
            }
        }
        .padding()
    }
}



struct Country: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}
struct Badge: ViewModifier {
    var status: VStack<Text>
    func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
         content
            status
                .padding(4)
                .background(.green)
                .cornerRadius(5)
        }
    }
}

//
//extension View {
//    func titleStyle() -> some View {
//        modifier(Title())
//    }
//    func waterMarked(with text: String) -> some View {
//        modifier(Watermark(text: text))
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(.black)
//        }
//    }
//}
//
//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .padding()
//            .background(.blue)
//            .cornerRadius(10)
//    }
//}
//
//struct TextCapsule: View {
//    var text: String
//    var body: some View {
//        Text(text)
//        .foregroundColor(.red)
//        .padding()
//    }
//}

struct Project3_Previews: PreviewProvider {
    static var previews: some View {
        Project3()
    }
}

extension View {
    func RowStyle() -> some View {
        modifier(Country())
    }
    func BadgeStyle(with status: VStack<Text>) -> some View {
        modifier(Badge(status: status))
    }
}
