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
@_exported import CYSwiftExtension

class EsensiilsadwsiwViewController: APPBasicViewController {

    private(set) var bgImgView: UIImageView = UIImageView(frame: CGRectZero)
    
    override func buildPageUI() {
        super.buildPageUI()
        
    }
    
    open var comsejDityID: String {
        return GLoskwCommenskwmodls.shared.productID ?? ""
    }
    
    override func refreshMineLocations() {
        super.refreshMineLocations()
        DeviceAuthorizationTool.authorization().requestDeviceLocation()
    }
}
