 //
//  Project7.swift
//  Project1
//
//  Created by Sai Pe Pu on 23/10/2566 BE.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
    
    var body: some View {
        return
            Text("This is User View")
    }
    func toString() {
        print("This is user object \n firstName: \(firstName) , LastName: \(lastName)")
    }
}

struct ForBody: View {
    @StateObject var user = User()
    
    var body: some View {
        return VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct UserCodable: Codable {
    let firstName: String
    let lastName: String
}

struct UserDefaultsView: View {
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    @AppStorage("tapCount") private var tapCount = 0
    @State private var user = UserCodable(firstName: "Sai", lastName: "PePu")
    @State private var savedUser = UserDefaults.standard.data(forKey: "UserData")
    
    var body: some View {
        ForBody()
        
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                }
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }.toolbar {
                EditButton()
            }
        }
        
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
        
        VStack {
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
//            Text("\(savedUser.firstName)")
        }

        
    }
    
    func removeRows(at index: IndexSet) {
        numbers.remove(atOffsets: index)
    }
}

struct UserDefaultsViewPreview: PreviewProvider {
    static var previews: some View {
        UserDefaultsView()
    }
}
