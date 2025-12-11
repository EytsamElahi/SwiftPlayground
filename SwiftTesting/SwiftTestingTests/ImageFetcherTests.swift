//
//  ImageFetcherTests.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 11/12/2025.
//

import Testing
@testable import SwiftTesting

struct ImageFetcherTests {
    @Test("calling callback function with async by wrapping in withCheckedContinuation", .timeLimit(.minutes(1)))
    func testing_callback_with_async() async throws {
        let imageFetcher = ImageFetcher()
        let result = try await withCheckedThrowingContinuation { continuation in
            imageFetcher.fetchImage(id: "photo1") { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        #expect(result == "Image_Data_For_photo1")
    }
}
