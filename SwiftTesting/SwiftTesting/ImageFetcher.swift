//
//  ImageFetcher.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 11/12/2025.
//

import Foundation
struct ImageFetcher {
    // Old style function using completion handler
    func fetchImage(id: String, completion: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            if id == "bad_id" {
                completion(.failure(URLError(.badURL)))
            } else {
                completion(.success("Image_Data_For_\(id)"))
            }
        }
    }
}
