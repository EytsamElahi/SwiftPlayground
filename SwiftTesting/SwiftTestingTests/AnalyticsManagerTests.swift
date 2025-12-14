//
//  AnalyticsManagerTests.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 10/12/2025.
//

import Testing
@testable import SwiftTesting

struct AnalyticsManagerTests {
    @Test("Making sure completion handler call once")
    func completion_handler_confirmation() async {
        let manager = await AnalyticsManager()
        await confirmation(expectedCount: 1) { confirmation in
            await manager.flushEvents {
                #expect(manager.isTracking == true) // should be true inside completion
                confirmation()
            }
        }
        // After flushEvents finishes, it should be false again
        #expect(manager.isTracking == false)
    }
}


