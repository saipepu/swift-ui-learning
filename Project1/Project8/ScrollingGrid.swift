//
//  ScrollingGrid.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct ScrollingGrid: View {
    
    let Grid = [
        GridItem(.adaptive(minimum: 280, maximum: 320))
    ]
     
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Grid) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGrid()
    }
}
