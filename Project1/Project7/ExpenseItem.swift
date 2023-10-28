//
//  Expenses.swift
//  Project1
//
//  Created by Sai Pe Pu on 24/10/2566 BE.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
