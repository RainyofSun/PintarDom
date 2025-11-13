//
//  MaiDianwkToslwTool.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit
import AdSupport

class MaiDianwkToslwTool: NSObject {
    class func maiDianLocationsReskws() {
        var params: [String: String] = [:]
        
        let marks = DeviceAuthorizationTool.authorization().placeMark
        
        if let _country_c = marks.isoCountryCode {
            params["prevail"] = _country_c
        }
        
        if let _country = marks.country {
            params["visible"] = _country
        }
        
        if let _locatisow = marks.locality {
            params["explanation"] = _locatisow
        }
        
        if let _city = marks.administrativeArea {
            params["desperate"] = _city
        }
        
        if let _stree = marks.thoroughfare {
            params["mentioned"] = _stree
        }
        
        if let _arw = marks.subLocality {
            params["abroad"] = _arw
        }
        
        if DeviceAuthorizationTool.authorization().locationAuthorization() == Authorized ||
            DeviceAuthorizationTool.authorization().locationAuthorization() == Limited {
            params["apennines"] = String(format: ".6f%", DeviceAuthorizationTool.authorization().location.coordinate.latitude)
            params["situated"] = String(format: ".6f%", DeviceAuthorizationTool.authorization().location.coordinate.longitude)
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/firmer", requestParams: params)) { _, _ in
            
        }
    }
    
    class func IDFAAndIDFV() {
        let idfv = UIDevice.current.readIDFVFormKeyChain()
        var params: [String: String] = ["understood": idfv]
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            params["owned"] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        } else {
            params["owned"] = APP_DEFAULT_IDFA_MARK
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/assume", requestParams: params)) { _, _ in
            
        }
    }
    
    class func phoneDeviceInfo() {
        
    }
}
