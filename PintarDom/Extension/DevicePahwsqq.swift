//
//  DevicePahwsqq.swift
//  PintarDom
//
//  Created by 一刻 on 2025/12/8.
//

import UIKit

extension UIDevice {
    func isIPhoneSE() -> Bool {
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width

        // 竖屏判断（兼容横屏时交换值）
        let minSide = min(width, height)
        let maxSide = max(width, height)

        return (minSide == 320 && maxSide == 568)   // iPhone SE 1st
            || (minSide == 375 && maxSide == 667)   // iPhone SE 2nd & 3rd
    }
}
