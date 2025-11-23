//
//  AuthtiemsModel.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class AuthtiemsModel: BasicsmNetResModel, YYModel {
    var exhibited: Int?
    /// 产品信息
    var idea: Idea?
    var protector: [Protector]?
    /// 下一步认证项
    var clearest: Clearest?
    /// 借款协议
    var assume: Assume?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["idea": Idea.self, "protector": Protector.self, "clearest": Clearest.self, "assume": Assume.self]
    }
}

class Idea: BasicsmNetResModel, YYModel {
    /// 产品id
    var bosom: String?
    /// 产品名称
    var lifeless: String?
    /// 产品LOGO
    var bless: String?
    /// 额度描述
    var encounter: String?
    /// 额度   调用下单接口时必传参数
    var dangers: String?
    /// 期限描述
    var train: String?
    /// 借款期限  调用下单接口时必传参数
    var clearly: String?
    /// 借款期限类型   调用下单接口时必传参数
    var trifling: String?
    /// 底部按钮文案
    var protect: String?
    /// 调用下单接口和埋点8时必传参数
    var comparatively: String?
    var dubious: String?
    /// 额度和费用信息
    var weighing: Weighing?
    var earnestness: Int?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["weighing": Weighing.self]
    }
}

class Weighing: BasicsmNetResModel, YYModel {
    var distinctions: Distinctions?
    var scrupulous: Scrupulous?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["distinctions": Distinctions.self, "scrupulous": Scrupulous.self]
    }
}

class Distinctions: BasicsmNetResModel {
    /// 期限描述
    var teach: String?
    var hinted: String?
}

class Scrupulous: BasicsmNetResModel {
    /// 利率描述
    var teach: String?
    var hinted: String?
}

class Protector: BasicsmNetResModel {
    /// 标题
    var teach: String?
    var lawful: String?
    var recall: String?
    /// 未完成时的描述
    var conjuring: String?
    /// 认证类型 实际下发值见值映射-产品详情认证项目列表
    var opposing: String?
    var persevere: String?
    var assisted: String?
    var index: IndexPath?
}

class Clearest: BasicsmNetResModel {
    /// 认证类型 实际下发值见值映射-产品详情认证项目列表
    var opposing: String?
    /// 认证项标题
    var teach: String?
}
