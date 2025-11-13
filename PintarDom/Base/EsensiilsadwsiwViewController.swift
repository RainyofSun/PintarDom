//
//  EsensiilsadwsiwViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit
@_exported import SnapKit
@_exported import YYKit
@_exported import JKSwiftExtension

class EsensiilsadwsiwViewController: APPBasicViewController {

    open var comsejDityID: String {
        return GLoskwCommenskwmodls.shared.productID ?? ""
    }
    
    override func refreshMineLocations() {
        super.refreshMineLocations()
        DeviceAuthorizationTool.authorization().requestDeviceLocation()
    }
}
