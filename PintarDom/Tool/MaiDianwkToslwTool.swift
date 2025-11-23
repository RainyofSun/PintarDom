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
            params["apennines"] = String(format: "%.6f", DeviceAuthorizationTool.authorization().location.coordinate.latitude)
            params["situated"] = String(format: "%.6f", DeviceAuthorizationTool.authorization().location.coordinate.longitude)
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
        
        let storage_model: StorageInfo = StorageInfo()
        let phone_disk_info = UIDevice.getAppDiskSize()
        storage_model.speaking = phone_disk_info["availableCapacity"] as? String
        storage_model.accident = phone_disk_info["totalCapacity"] as? String
        storage_model.gathered = "\(UIDevice.current.memoryTotal)"
        storage_model.unsatisfactory = UIDevice.getFreeMemory()
        
        APPCocoaLog.debug(" ----- 埋点内存 -------\n 总容量 = \(storage_model.accident ?? "") \n 可用容量 = \(storage_model.speaking ?? "") \n 总内存 = \(storage_model.gathered ?? "") \n 可用内存 = \(storage_model.unsatisfactory ?? "") \n")
        
        let e_model: BatteryInfo = BatteryInfo()
        let phone_e = UIDevice.current.appBattery()
        
        e_model.judging = phone_e.first
        e_model.alarm = phone_e.last
        
        APPCocoaLog.debug(" ----- 埋点电量 -------\n 电池电量 = \(e_model.judging ?? "") \n 电池状态 = \(e_model.alarm ?? "") \n")
        
        let deviceStatus: DeviceStatus = DeviceStatus()
        deviceStatus.late = UIDevice.current.isJailbroken ? "1" : "0"
        deviceStatus.walked = UIDevice.current.isSimulator ? "1" : "0"
        
        APPCocoaLog.debug(" ----- 埋点设备 -------\n 是否是模拟器 = \(deviceStatus.walked ?? "") \n 是否越狱 = \(deviceStatus.late ?? "") \n")
        
        let sys_model: SystemInfo = SystemInfo()
        sys_model.ungenerous = TimeZone.current.identifier
        sys_model.understood = UIDevice.current.readIDFVFormKeyChain()
        sys_model.wretchedness = Locale.current.identifier
        sys_model.partly = UIDevice.current.getNetconnType()
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            sys_model.owned = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        } else {
            sys_model.owned = APP_DEFAULT_IDFA_MARK
        }
        
        APPCocoaLog.debug(" ----- 埋点版本 -------\n 系统时区 = \(sys_model.ungenerous ?? "") \n 设备IDFV = \(sys_model.understood ?? "") \n 设备网络类型 = \(sys_model.partly ?? "") \n 设备IDFA = \(sys_model.owned ?? "") 设备语言 = \(sys_model.wretchedness ?? "") \n")

        let device_info: DeviceInfo = DeviceInfo()
        device_info.quesnel = UIDevice.current.systemVersion
        device_info.hints = UIDevice.current.machineModelName
        device_info.strange = UIDevice.current.machineModel
        
        APPCocoaLog.debug(" ----- 埋点版本 -------\n 系统版本 = \(device_info.quesnel ?? "") \n 设备名称 = \(device_info.hints ?? "") \n 设备原始版本 = \(device_info.strange ?? "") \n")
        
        let wifi_model: WifiInfo = WifiInfo()
        let _w_a_info = UIDevice.current.getWiFiInfo()
        wifi_model.hitherto = _w_a_info.first
        wifi_model.able = _w_a_info.last
        
        let wifi_wapper: WifiWrapper = WifiWrapper()
        wifi_wapper.forborne = wifi_model
        
        APPCocoaLog.debug(" ----- 埋点设备WIFI -------\n SSID = \(wifi_model.hitherto ?? "") \n BSSID = \(wifi_model.able ?? "") \n")
        
        let d_model: MaiDianPhoneDeviceInfo = MaiDianPhoneDeviceInfo()
        d_model.another = storage_model
        d_model.imperfect = e_model
        d_model.appears = device_info
        d_model.follows = deviceStatus
        d_model.compliance = sys_model
        d_model.importance = wifi_wapper
        
        guard let jso = d_model.modelToJSONString() else { return }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/recovering", requestParams: ["bade": jso])) { _, _ in
            
        }
    }
    
    class func fengKongMaidian(type: MaiDianEventUploadStyle, beginTime: String? = nil, endTime: String? = nil, orderNumber: String? = nil) {
        var maikswoPaokas: [String: String] = ["ask": type.rawValue, "ventured": "2", "curiosity": UIDevice.current.readIDFVFormKeyChain()]

        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            maikswoPaokas["character"] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        
        if DeviceAuthorizationTool.authorization().locationAuthorization() == Authorized ||
            DeviceAuthorizationTool.authorization().locationAuthorization() == Limited {
            maikswoPaokas["situated"] = String(format: "%.6f", DeviceAuthorizationTool.authorization().location.coordinate.latitude)
            maikswoPaokas["apennines"] = String(format: "%.6f", DeviceAuthorizationTool.authorization().location.coordinate.longitude)
        }
        
        if let _id = beginTime {
            maikswoPaokas["likely"] = _id
        }
        
        if let _ends = endTime {
            maikswoPaokas["meant"] = _ends
        }
        
        if let _idsnw = orderNumber {
            maikswoPaokas["talking"] = _idsnw
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/bear", requestParams: maikswoPaokas)) { _, _ in
            
        }
    }
}
