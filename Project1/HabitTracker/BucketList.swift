//
//  Habits.swift
//  Project1
//
//  Created by Sai Pe Pu on 24/10/2566 BE.
//

import Foundation

class BucketList: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
