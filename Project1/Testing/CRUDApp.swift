//
//  CRUDApp.swift
//  Project1
//
//  Created by Sai Pe Pu on 28/10/2566 BE.
//

import SwiftUI

struct Response: Codable {
    var success: Bool
    var message: String
}

struct Person: Codable {
    var name: String
    var age: Int
}

struct CRUDApp: View {
    var api = "http://localhost:3000"
    @State private var getData: String = ""
    
    var body: some View {
        VStack {
//            Button("GET") {
//                print("GET Request")
//                guard let url = URL(string: api) else { return }
//
//                URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    if let error = error {
//                        print("Error: ", error)
//                    } else if let data = data {
//                        print(data, "response 24")
//                        if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
//                            print(decodedData.message, "response 38")
//                            getData = decodedData.message
//                        }
//                    }
//                }.resume()
//            }
//            Text(getData)
//            Button("POST") {
//                print("POST Request")
//                guard let url = URL(string: "\(api)/api/data") else { return }
//
//                do {
//                    let person = Person(name: "pepu", age: 21)
//                    let jsonData = try JSONEncoder().encode(person)
//
//                    var request = URLRequest(url: url)
//                    request.httpMethod = "POST"
//                    request.httpBody = jsonData
//                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//                    URLSession.shared.dataTask(with: request) { (data, response, error) in
//                        if let error = error {
//                            print("Error: ", error)
//                        } else if let data = data {
//                            if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
//                                print(decodedData.success, decodedData.message)
//                            } else { return }
//                        }
//                    }.resume()
//                } catch let error {
//                    print("Error", error)
//                }
//
//            }
            Button("GET") {
                print("GET Request")
                
                let url = URL(string: api)
                do {
                    URLSession.shared.dataTask(with: url!) { (data,response,error) in
                        if let error = error {
                            print("Request error: ", error)
                        } else if let data = data {
                            if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
                                print("Response", decodedData.success)
                                getData = decodedData.message
                            } else {
                                return
                            }
                        }
                    }.resume()
                } catch let error {
                    print("Request Error: ", error)
                }
                
            }
            Text(getData)
            Button("POST") {
                print("POST Request")
                
                do {
                    let data = Person(name: "PEPU", age: 21)
                    let jsonData = try JSONEncoder().encode(data)
                    
                    let url = URL(string: "\(api)/api/data")
                    var request = URLRequest(url: url!)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpBody = jsonData
                    
                    URLSession.shared.dataTask(with: request) { (data, response, error) in
                        if let error = error {
                            print("Request Error: ", error)
                        } else if let data = data {
                            do {
                                let decodedData = try JSONDecoder().decode(Response.self, from: data)
                                    print("Response: " ,decodedData.message)
                            } catch {
                                print("Error decoding data: \(error)")
                            }
                        }
                    }.resume()
                } catch {
                    print("Request Error: \(error)")
                }
            }
        }
    }
}

struct CRUDApp_Previews: PreviewProvider {
    static var previews: some View {
        CRUDApp()
    }
}
