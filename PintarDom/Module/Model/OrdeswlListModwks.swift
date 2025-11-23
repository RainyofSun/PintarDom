//
//  OrdeswlListModwks.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit
class OrdeswlListModwks: BasicsmNetResModel, YYModel {
    var slowly: [OrderItem]?
    var report: Int?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["slowly": OrderItem.self]
    }
}

class OrderItem: BasicsmNetResModel, YYModel {
    var earnestness: String?
    var reports: String?
    var floating: Int?
    var lifeless: String?
    var bless: String?
    var caught: String?
    var reserve: String?
    var wrapped: String?
    var protect: String?
    var repeatedly: String?
    var considerable: String?
    var detained: String?
    var positive: String?
    var satisfactory: String?
    var learning: String?
    var deal: String?
    var head: String?
    var clearly: String?
    var fast: [FastItem]?
    var fortunes: String?
    var broken: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["fast": FastItem.self]
    }
}

class FastItem: BasicsmNetResModel {
    var teach: String?
    var shook: String?
}
