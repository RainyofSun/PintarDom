//
//  FontExtesniwksl.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit
enum FontStyle: String {
    case Arial_Regular = "Arial-Regular"
    case Arial_BoldMT = "Arial-BoldMT"
    case Inter_Regular = "Inter-Regular"
    case Inter_Medium = "Inter-Medium"
    case Inter_Bold = "Inter-Bold"
}

extension UIFont {
    static func loadSpecialFont(size: CGFloat, ftStyle: FontStyle) -> UIFont {
        return self.init(name: ftStyle.rawValue, size: size) ?? UIFont.systemFont(ofSize: size);
    }
}
