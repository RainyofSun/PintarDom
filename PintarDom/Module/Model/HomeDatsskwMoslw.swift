//
//  HomeDatsskwMoslw.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/19.
//

import UIKit

// MARK: - Root
class HomeDatsskwMoslw: BasicsmNetResModel, YYModel {
    var conveying: Conveying?
    var assume: Assume?
    var here: [String]?
    var recovered: Int?
    var gate: Int?
    var weeping: String?
    var slowly: [SlowlyItem]?
    
    var bigDats: UnaffectedListItem?
    var smallDats: UnaffectedListItem?
    var loadLis: [UnaffectedListItem]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["conveying": Conveying.self, "assume": Assume.self, "slowly": SlowlyItem.self]
    }
    
    func loanChanswFilters() {
        guard let _ppskw = self.slowly else {
            return
        }
        
        for item in _ppskw {
            if let _tspw = item.fainted {
                if _tspw == ShouYeElement.BigpwjsuCard.rawValue {
                    self.bigDats = item.unaffected?.first
                }
                
                if _tspw == ShouYeElement.SmallalsowCard.rawValue {
                    self.smallDats = item.unaffected?.first
                }
                
                if _tspw == ShouYeElement.ProductskkList.rawValue {
                    self.loadLis = item.unaffected
                }
            }
        }
    }
}

// MARK: - conveying
class Conveying: BasicsmNetResModel {
    var opportunity: String?
    var omit: String?
    var firmer: String?
    var recovering: String?
}

// MARK: - assume
class Assume: BasicsmNetResModel {
    var teach: String?
    var stopping: String?
}

// MARK: - slowly item
class SlowlyItem: BasicsmNetResModel, YYModel {
    var fainted: String?
    
    // 因为 "unaffected" 有可能是数组，也可能是对象 → 使用枚举类型解析
    var unaffected: [UnaffectedListItem]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["unaffected": UnaffectedListItem.self]
    }
}

// MARK: - list item (BANNER / PRODUCT_LIST)
class UnaffectedListItem: BasicsmNetResModel, YYModel {
    var totally: String?
    var assure: String?
    var commanding: String?
    var nor: Int?
    var teach: String?
    
    // PRODUCT_LIST extra fields
    var bosom: String?
    var lifeless: String?
    var bless: String?
    var protect: String?
    var care: String?
    var prolong: String?
    var shewn: String?
    var oblige: String?
    var repeats: String?
    var worthy: String?
    var distraction: String?
    var spare: String?
    var unnecessary: [String]?
    
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return ["repeats": "repeat"]
    }
}
