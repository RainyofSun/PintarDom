//
//  CardAushwModel.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class CardAushwModel: BasicsmNetResModel, YYModel {
    var unaffected: Unaffected?
    var sounds: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["unaffected": Unaffected.self]
    }
}

class Unaffected: BasicsmNetResModel {
    var attainable: Int?
    /// 证件文案
    var brooded: String?
    /// 证件地址  有值代表证件上传完成
    var mere: String?
    /// 人脸自拍文案
    var suggestion: String?
    /// 人脸照片地址  有值代表自拍上传完成
    var conquest: String?
}
