//
//  BookWorm.swift
//  Project1
//
//  Created by Sai Pe Pu on 27/10/2566 BE.
//

import SwiftUI

struct BookWorm: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBook()
                }
        }
    }
}

struct BookWorm_Previews: PreviewProvider {
    static var previews: some View {
        BookWorm()
    }
}
