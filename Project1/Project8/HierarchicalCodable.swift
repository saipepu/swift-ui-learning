//
//  HierarchicalCodable.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import SwiftUI

struct Signer: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct HierarchicalCodable: View {
    var body: some View {
        Button("Decode JSON") {
            let json = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                        }
                }
            """
            let data = Data(json.utf8)
            
            if let user = try? JSONDecoder().decode(Signer.self, from: data) {
                print(user.address)
            }
        }
    }
}

struct HierarchicalCodable_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodable()
    }
}
