//
//  ContactswkinfoModel.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/23.
//

import UIKit

class ContactswkinfoModel: BasicsmNetResModel, YYModel {
    var obvious: [Obvious]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["obvious": Obvious.self]
    }
}

class Obvious: BasicsmNetResModel, YYModel {
    /// 用户已选择的关系，回显时需要根据该值去选项里面匹配对应的name
    var farther: String?
    /// 姓名
    var able: String?
    /// 手机号
    var press: String?
    var uttered: [Uttered]?
    /// 组标题
    var teach: String?
    /// 关系文本框标题
    var forbore: String?
    /// 关系文本框placeholder提示
    var depended: String?
    /// 姓名+手机号文本框标题
    var malice: String?
    /// 姓名+手机号文本框placeholder提示
    var arose: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["uttered": Uttered.self]
    }
}

class ConstacesSaveModel: BasicsmNetResModel {
    var able: String?
    var farther: String?
    var press: String?
    var personTag: Int = .zero
}
