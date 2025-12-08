//
//  NetRool.swift
//  PintarDom
//
//  Created by 一刻 on 2025/12/8.
//

import UIKit
import Network

class NetworkStatusMonitor {
    static let shared = NetworkStatusMonitor()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    var isConnected: Bool = false
    var isCellular: Bool = false

    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            self.isCellular = path.usesInterfaceType(.cellular)
        }
        monitor.start(queue: queue)
    }
}
