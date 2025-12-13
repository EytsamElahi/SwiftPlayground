//
//  BluetoothScannerTest.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 13/12/2025.
//

import Testing
@testable import SwiftTesting

struct BluetoothScannerTests {
    @Test("Get bluetooth device name", .timeLimit(.minutes(1)))
    func scanned_devices() async {
        let manager = MockBluetoothDelegate()
        let deviceName: String = await withCheckedContinuation { continuation in
            // 1. Setup the listener
            manager.onDeviceDiscovered = { name in
                continuation.resume(returning: name)
            }
            // 2. Trigger the action (inside the block is safe)
            // This guarantees we are listening before the event fires.
            manager.startScan()
        }
        #expect(deviceName == "AirPods Pro")
    }

}
