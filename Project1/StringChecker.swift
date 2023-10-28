//
//  StringChecker.swift
//  Project1
//
//  Created by Sai Pe Pu on 18/10/2566 BE.
//

import SwiftUI

struct StringChecker: View {
    @State private var newWord = ""
    @State private var rootWord = "hello"
    @State private var wordList: [String] = ["hello", "hi", "Hola"]
    
    var body: some View {
        NavigationView {
            List {
                TextField("Enter", text: $newWord)
                    .autocapitalization(.none)
            }
            .navigationTitle("TextChecker")
            .onSubmit(handleSubmit)
        }
    }
    func handleSubmit() {
        print(newWord)
        print(isOriginal(word: newWord))
        print(isReal(word: newWord))
    }
    func isOriginal(word: String) -> Bool {
        return wordList.contains(word)
    }
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        print(misspelledRange)
        return misspelledRange.location == NSNotFound
    }
}

struct StringChecker_Previews: PreviewProvider {
    static var previews: some View {
        StringChecker()
    }
}
