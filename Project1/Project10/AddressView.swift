//
//  Sending&ReceivingData.swift
//  Project1
//
//  Created by Sai Pe Pu on 26/10/2566 BE.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section("Enter your address") {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }.disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
