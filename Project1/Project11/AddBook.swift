//
//  AddBook.swift
//  Project1
//
//  Created by Sai Pe Pu on 27/10/2566 BE.
//

import SwiftUI

struct AddBook: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantazy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Triller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    
//                    Picker("Rating", selection: $rating) {
//                        ForEach(0..<6) {
//                            Text(String($0))
//                        }
//                    }
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
//                         add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review

                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

struct AddBook_Previews: PreviewProvider {
    static var previews: some View {
        AddBook()
    }
}
