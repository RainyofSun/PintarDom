//
//  MineskwOpskwModel.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/19.
//

import UIKit

class MineskwOpskwModel: BasicsmNetResModel, YYModel {
    var slowly: [MenuItem]?
    var unequal: OrderCount?
    var roused: Int?
    var exclaim: ExclaimInfo?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["slowly": MenuItem.self, "unequal": OrderCount.self, "exclaim": ExclaimInfo.self]
    }
}

class MenuItem: BasicsmNetResModel {
    var teach: String?
    var totally: String?
    var conveying: String?
}

class OrderCount: BasicsmNetResModel {
    var morrow: Int?
    var quickness: Int?
}

class ExclaimInfo: BasicsmNetResModel {
    var teach: String?
    var force: String?
    var instantaneous: String?
}
