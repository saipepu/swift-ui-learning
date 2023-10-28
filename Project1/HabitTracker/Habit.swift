//
//  Habit.swift
//  Project1
//
//  Created by Sai Pe Pu on 24/10/2566 BE.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var priority: Int
}
