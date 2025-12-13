//
//  BluetoothScanner.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 13/12/2025.
//

import Foundation

protocol BluetoothScannerDelegate: AnyObject {
    func didDiscoverDevice(name: String)
}

class BluetoothScanner {
    weak var delegate: BluetoothScannerDelegate?

    func startScan() {
        // Simulate finding a device after a short delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            self.delegate?.didDiscoverDevice(name: "AirPods Pro")
        }
    }
}

class MockBluetoothDelegate: BluetoothScannerDelegate {
    private let scanner = BluetoothScanner()
    var onDeviceDiscovered: ((String) -> ())? = nil

    init() {
        scanner.delegate = self
    }

    func didDiscoverDevice(name: String) {
        debugPrint("Device Found: \(name)")
        onDeviceDiscovered?(name)
    }

    func startScan() {
        scanner.startScan()
    }
}
