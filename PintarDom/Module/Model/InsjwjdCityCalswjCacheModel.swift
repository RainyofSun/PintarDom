//
//  InsjwjdCityCalswjCacheModel.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/19.
//

import UIKit

class InsjwjdCityCalswjCacheModel: BasicsmNetResModel, YYModel {
    var bosom: String?
    var fainter: String?
    var able: String? // city
    var brought: String?
    var fast: [InsjwjdCityCalswjCacheModel]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["fast": InsjwjdCityCalswjCacheModel.self]
    }
    
    class func saveCsitjwDataToDiskwks(_ json: String) {
        FileManager.default.createFile(atPath: GLoskwCommenskwmodls.shared.ciprosjdkCityPath, contents: json.data(using: String.Encoding.utf8))
    }
    
    class func readCosiDataFormsDisk() -> [InsjwjdCityCalswjCacheModel] {
        if !FileManager.default.fileExists(atPath: GLoskwCommenskwmodls.shared.ciprosjdkCityPath) {
            return []
        }
        
        do {
            let dis = try Data(contentsOf: NSURL(fileURLWithPath: GLoskwCommenskwmodls.shared.ciprosjdkCityPath) as URL)
            return (NSArray.modelArray(with: InsjwjdCityCalswjCacheModel.self, json: dis) as? [InsjwjdCityCalswjCacheModel]) ?? []
        } catch {
            
        }
        
        return []
    }
}
