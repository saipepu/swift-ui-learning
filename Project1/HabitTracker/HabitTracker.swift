//
//  SwiftUIView.swift
//  Project1
//
//  Created by Sai Pe Pu on 24/10/2566 BE.
//

import SwiftUI

struct HabitTracker: View {
    @StateObject var bucketList = BucketList()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bucketList.items) {item in
                    HStack {
                        VStack {
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabit(bucketList: bucketList)
        }
    }
}

struct HabitTracker_Preview: PreviewProvider {
    static var previews: some View {
        HabitTracker()
    }
}
