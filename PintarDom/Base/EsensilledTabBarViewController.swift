//
//  EsensilledTabBarViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class EsensilledTabBarViewController: APPBasicTabBarViewController {

    override func tabbarHookMethod() {
        super.tabbarHookMethod()
        
        GLoskwCommenskwmodls.shared.addObserver(self, forKeyPath: LOGIN_OBERVER_KEY, options: [.new], context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(persownReNeedLogisnw), name: NSNotification.Name(APP_LOGIN_EXPIRED_NOTIFICATION), object: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let _slwl_p = keyPath, let _news_ewkd = change?[.newKey] as? Bool {
            if _slwl_p == LOGIN_OBERVER_KEY && !_news_ewkd {
                self.selectedIndex = .zero
            }
        }
    }
    
    override func setTabControllerElements(controllers vcArray: [UIViewController.Type], barImages images: [[String]]) {
        
    }
}

@objc extension EsensilledTabBarViewController {
    func persownReNeedLogisnw() {
        let _navskw_conolse: EsensiilsaaJawwsNavViewController = EsensiilsaaJawwsNavViewController(rootViewController: PerswnsLogiswskViewController())
        _navskw_conolse.modalPresentationStyle = .overFullScreen
        self.present(_navskw_conolse, animated: true)
    }
}
