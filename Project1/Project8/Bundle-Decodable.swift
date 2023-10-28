//
//  Bundle-Decodable.swift
//  Project1
//
//  Created by Sai Pe Pu on 25/10/2566 BE.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        // check if file exists on the bundle or not
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // check if the file is loaded successfully or not
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // check if the json data is decoded successfully or not
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
