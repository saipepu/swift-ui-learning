//
//  CheckoutView.swift
//  Project1
//
//  Created by Sai Pe Pu on 26/10/2566 BE.
//

import SwiftUI
import Foundation

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        print(type(of: AsyncImage(url: URL(string: ""), scale: 1)))
        return ScrollView {
            VStack {
//                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) {image in
                AsyncImage(url: URL(string: "https://www.daninoce.com.br/wp-content/uploads/2019/04/receitas-de-cupcake-destaque-960x625.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        // encode
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // request header set up
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
        // sent
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        // decode
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            print(decodedOrder.quantity)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed.")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order()) // we have to pass an instance here just so we can preview this UI View
    }
}
