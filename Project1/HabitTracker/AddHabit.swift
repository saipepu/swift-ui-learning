//
//  AddHabit.swift
//  Project1
//
//  Created by Sai Pe Pu on 24/10/2566 BE.
//

import SwiftUI

struct AddHabit: View {
    @State private var name = ""
    @State private var priority = 9
    @ObservedObject var bucketList: BucketList
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("add new good habit", text: $name)
                Picker("Priority", selection: $priority) {
                    ForEach(1..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button {
                    let item = Habit(name: name, priority: priority)
                    bucketList.items.append(item)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(bucketList: BucketList())
    }
}
