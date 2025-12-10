//
//  AnalyticsManager.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 10/12/2025.
//

class AnalyticsManager {
    var isTracking = false

    func trackEvent(name: String) async {
        // Simulate network delay
        try? await Task.sleep(for: .milliseconds(100))
        print("Event tracked: \(name)")
    }

    func flushEvents(completion: () -> Void) async {
        isTracking = true
        await trackEvent(name: "app_launch")
        await trackEvent(name: "screen_view")
        completion()
        isTracking = false
    }
}
