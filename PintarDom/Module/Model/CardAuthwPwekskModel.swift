//
//  CardAuthwPwekskModel.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class CardAuthwPwekskModel: BasicsmNetResModel, YYModel {
    var vague: [Vague]?
    var img_url: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["vague": Vague.self]
    }
}

class Vague: BasicsmNetResModel {
    /// 姓名文案
    var revolt: String?
    /// 内容
    var delicacy: String?
    /// 保存时传入的参数key
    var fainter: String?
}
