//
//  FeatureManager.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 13/12/2025.
//

struct FeatureManager {
    static var isBetaEnabled: Bool = false

    func generateReport() -> String {
        if FeatureManager.isBetaEnabled {
            return "Beta Report 2.0" // New feature
        } else {
            return "Standard Report 1.0"
        }
    }

    func calculateTax(amount: Double) -> Double {
        if amount < 0 { fatalError("Crash!") }
        return amount * 0.15
    }
}
