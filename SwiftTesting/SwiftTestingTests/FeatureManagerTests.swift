//
//  FeatureManagerTests.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 13/12/2025.
//

import Testing
@testable import SwiftTesting

struct FeatureManagerTests {

    @Test("Standard Report Generation")
    func test_standard_report() {
        let manager = FeatureManager()
        let report = manager.generateReport()
        #expect(report == "Standard Report 1.0")
    }

    @Test("Beta Report Generation",
          .enabled(if: FeatureManager.isBetaEnabled),
          .tags(.beta)
          )
    func test_beta_report() {
        let manager = FeatureManager()
        let report = manager.generateReport()
        // We only expect this to pass if the flag allowed us to enter here
        #expect(report == "Beta Report 2.0")
    }

    @Test("Calculate Negative Tax - Negative Amount",
           .bug("https://github.com/myrepo/issues/404", "Crash on negative numbers"),
           .disabled("Disabled until issue #404 is fixed"),
           .tags(.flaky)
          )
    func test_calculate_test_crash() {
        let manager = FeatureManager()
        let _ = manager.calculateTax(amount: -2)
    }
}

extension Tag {
    @Tag static var flaky: Self
    @Tag static var beta: Self
}
