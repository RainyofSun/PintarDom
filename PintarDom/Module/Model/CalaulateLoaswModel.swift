//
//  CalaulateLoaswModel.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/26.
//

import UIKit

class CalaulateLoaswModel: BasicsmNetResModel, YYModel {
    /// 每月还款金额
    var gentlest: String?
    /// 本金
    var coolly: String?
    /// 总利息
    var distrust: String?
    /// 总金额
    var incited: String?
    /// 还款计划
    var exaggerations: [Exaggerations]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["exaggerations": Exaggerations.self]
    }
}

class Exaggerations: BasicsmNetResModel {
    /// 还款日
    var presented: String?
    /// 序号
    var terrors: Int?
    /// 本金
    var distinctly: String?
    /// 利息
    var arisen: String?
    /// 剩余本金
    var justified: String?
    /// 每月还款金额
    var gentlest: String?
}
