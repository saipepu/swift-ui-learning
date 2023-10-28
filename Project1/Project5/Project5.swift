//
//  Project5.swift
//  Project1
//
//  Created by Sai Pe Pu on 18/10/2566 BE.
//

import SwiftUI

struct Project5: View {
    @State private var usedWords = [String]()
    @State private var rootWord = "prolongs"
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .toolbar{
                Button("Restart", action: startGame)
            }
        }
    }
    func addNewWord() {
        print(newWord, "This is addNewWord")
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word alread used", message: "Try to be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that from \(rootWord)")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up.")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct Project5_Previews: PreviewProvider {
    static var previews: some View {
        Project5()
    }
}
func loadFile() {
    if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
        if let fileContents = try? String(contentsOf: fileURL) {
            fileContents
        }
    }
}
