//
//  APIHelper.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import Foundation
import SwiftUI



public enum APIHelper{
    
    enum APIError: Error{
        case error(_ errorString: String)
    }
    
    static func getJSON<T: Decodable>(urlString: String, complation: @escaping (Result<T, APIError>) ->Void){
        guard let url = URL(string: urlString) else {
            complation(.failure(.error("Invalid URL")))
            return
        }
        let request = URLRequest(url: url)
        print(request)
        
        URLSession.shared.dataTask(with: request) { opData, opResponse, opError in
            if let error = opError {
                complation(.failure(.error("URL Error = \(error.localizedDescription)")))
            }
            
            guard let data = opData else {
                complation(.failure(.error("Data corrupted")))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = .deferredToData
            decoder.keyDecodingStrategy = .useDefaultKeys
            print("Data")
            print("\(String(describing: opData))")
            
            
            guard let decodedData = try? decoder.decode(T.self, from: data) else {
                complation(.failure(.error("Error: decoding data")))
                return
            }
            
            complation(.success(decodedData))
        }.resume()
        
    }
}
