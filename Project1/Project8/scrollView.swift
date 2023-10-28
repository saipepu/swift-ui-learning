//
//  scrollView.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText \(text)")
        self.text = text
    }
}

struct scrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
        }
    }
}

struct scrollView_Previews: PreviewProvider {
    static var previews: some View {
        scrollView()
    }
}
