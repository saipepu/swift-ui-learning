//
//  Project1App.swift
//  Project1
//
//  Created by Sai Pe Pu on 14/10/2566 BE.
//

import SwiftUI

@main
struct Project1App: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            BookWorm()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}


