//
//  PushingNewView.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct PushingNewView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row+1)")
                } label: {
                    Text("Link \(row+1)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct PushingNewView_Previews: PreviewProvider {
    static var previews: some View {
        PushingNewView()
    }
}
