//
//  MaiDianPhoneDeviceInfo.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit
import Foundation

class MaiDianPhoneDeviceInfo: BasicsmNetResModel, YYModel {
    var another: StorageInfo?
    var imperfect: BatteryInfo?
    var appears: DeviceInfo?
    var follows: DeviceStatus?
    var compliance: SystemInfo?
    var importance: WifiWrapper?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["another": StorageInfo.self, "imperfect": BatteryInfo.self, "appears": DeviceInfo.self,
                "follows": DeviceStatus.self, "compliance": SystemInfo.self, "importance": WifiInfo.self]
    }
}

// MARK: - another
class StorageInfo: BasicsmNetResModel {
    var speaking: String?        // 可用存储大小（Byte）
    var accident: String?        // 总存储（Byte）
    var gathered: String?        // 总内存（Byte）
    var unsatisfactory: String?  // 可用内存（Byte）
}

// MARK: - imperfect
class BatteryInfo: BasicsmNetResModel {
    var judging: String?    // 剩余电量（百分比）
    var alarm: String?      // 是否充电 0/1
}

// MARK: - appears
class DeviceInfo: BasicsmNetResModel {
    var quesnel: String?   // 系统版本
    var hints: String?     // 设备品牌
    var strange: String?   // 原始设备型号
}

// MARK: - follows
class DeviceStatus: BasicsmNetResModel {
    var walked: String?   // 是否模拟器
    var late: String?     // 是否越狱
}

// MARK: - compliance
class SystemInfo: BasicsmNetResModel {
    var ungenerous: String?  // 时区 ID
    var understood: String?  // IDFV
    var wretchedness: String?// 语言
    var partly: String?      // 网络类型
    var owned: String?       // IDFA
}

// MARK: - importance
class WifiWrapper: BasicsmNetResModel, YYModel {
    var forborne: WifiInfo?  // 当前 wifi 信息（可能为空对象）

    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["forborne": WifiInfo.self]
    }
}

class WifiInfo: Codable {
    var hitherto: String?  // mac
    var able: String?      // name
}
