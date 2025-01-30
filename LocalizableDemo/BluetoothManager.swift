//
//  BluetoothManager.swift
//  LocalizableDemo
//
//  Created by Huei-Der Huang on 2025/1/30.
//

import Foundation
import CoreBluetooth

class BluetoothManager: NSObject {
    static let shared = BluetoothManager()
    
    private var manager: CBCentralManager?
    
    func requestPermission() {
        manager = nil
        manager = CBCentralManager(delegate: self, queue: nil, options: nil)
    }
}

extension BluetoothManager: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("poweredOn")
        case .poweredOff:
            print("poweredOff")
        case .resetting:
            print("resetting")
        case .unauthorized:
            print("unauthorized")
        case .unknown:
            print("unknown")
        case .unsupported:
            print("unsupported")
        default:
            break
        }
    }
}
