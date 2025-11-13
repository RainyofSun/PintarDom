//
//  EsensiilsaaJawwsViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class EsensiilsaaJawwsNavViewController: APPNavigationViewController {
    override func buildNavigation() {
        super.buildNavigation()
        self.navigationAppearanceSetting()
    }
    
    override func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if self.viewControllers.count < navigationBar.items?.count ?? 1 {
            return true
        }
        
        var canPopCsuePage = true
        if let _c_v = self.topViewController, _c_v.conforms(to: CurrentControllerShouldPopProtocol.self) {
            canPopCsuePage = _c_v.shouldPop()
        }
        
        if canPopCsuePage {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        } else {
            for item in navigationBar.subviews {
                if 0.0 < item.alpha && item.alpha < 1.0 {
                    UIView.animate(withDuration: 0.25) {
                        item.alpha = 1.0
                    }
                }
            }
        }
    
        return false
    }
}
