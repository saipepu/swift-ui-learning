//
//  DataController.swift
//  Project1
//
//  Created by Sai Pe Pu on 27/10/2566 BE.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BookWorm")
    
    init() {
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
