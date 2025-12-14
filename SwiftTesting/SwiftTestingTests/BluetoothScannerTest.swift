//
//  BluetoothScannerTest.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 13/12/2025.
//

import Testing
@testable import SwiftTesting

struct BluetoothScannerTests {
    @Test("Get bluetooth device name",
        .timeLimit(.minutes(1)))
    func scanned_devices() async {
        let manager = MockBluetoothDelegate()
        let deviceName: String = await withCheckedContinuation { continuation in
            manager.onDeviceDiscovered = { name in
                continuation.resume(returning: name)
            }
            manager.startScan()
        }
        #expect(deviceName == "AirPods Pro")
    }

}

