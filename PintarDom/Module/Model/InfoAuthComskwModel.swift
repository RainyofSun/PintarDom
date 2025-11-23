//
//  InfoAuthComskwModel.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class InfoAuthComskwModel: BasicsmNetResModel, YYModel {
    var land: [Land]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["land": Land.self]
    }
}

class Land: BasicsmNetResModel, YYModel {
    var bosom: String?
    /// 标题
    var teach: String?
    /// placeholder提示
    var conjuring: String?
    /// 上传的键名
    var fainter: String?
    var solely: String?
    var uttered: [Uttered]?
    var persevere: String?
    var inclined: Bool?
    var fainted: String?
    /// 回显值
    var sighed: String?
    /// inputType=1 使用数字键盘
    var observations: String?
    var shrunk: Int?
    var recall: Int?
    var soul: Int?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["uttered": Uttered.self]
    }
}

class Uttered: BasicsmNetResModel {
    /// 显示的value
    var able: String?
    /// 提交的value
    var fainted: String?
}
