//
//  ResizingImage.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct ResizingImage: View {
    var body: some View {
        GeometryReader { geo in
            Image("food")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.5)
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
    }
}

struct ResizingImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizingImage()
    }
}
