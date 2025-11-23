//
//  AppChuShiMwoskModel.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/14.
//

import UIKit

class AppChuShiMwoskModel: BasicsmNetResModel, YYModel {
    var oppressed: String?        // APP语言 1=英语 2=印尼语
    var privacyPolicyUrl: String?
    var calmed: CalmedInfo?    // fb 配置参数
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["calmed": CalmedInfo.self]
    }
}

class CalmedInfo: BasicsmNetResModel {
    var held: String?      // CFBundleURLScheme
    var exiled: String?    // FacebookAppID
    var wanderer: String?  // FacebookDisplayName
    var blank: String?     // FacebookClientToken
}

class MutabslwDomainsasModel: BasicsmNetResModel {
    var cp: String?
}
