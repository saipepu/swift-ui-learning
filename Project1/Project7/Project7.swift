//
//  Project7.swift
//  Project1
//
//  Created by Sai Pe Pu on 24/10/2566 BE.
//

import SwiftUI

struct Project7: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items) {item in
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: "USD"))
                            }
                        }
                    }.onDelete(perform: removeItems)
                }
                Section("Business") {
                    ForEach(expenses.items) {item in
                        if item.type == "Business" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: "USD"))
                            }
                        }
                    }.onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct Project7_Previews: PreviewProvider {
    static var previews: some View {
        Project7()
    }
}
