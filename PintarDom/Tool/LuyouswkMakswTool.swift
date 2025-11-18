//
//  LuyouswkMakswTool.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit

class LuyouswkMakswTool: NSObject {

    public static let luYou = LuyouswkMakswTool()
    
    private var webLuYousCallbakcMethods: [String] = [CloseWebPage, PageTransitionNoParams, CloseAndGotoHome, GotoAppStore, ConfirmApplyBury]
    
    public func tiaoZhuanPage(luyouUrl url: String, needBackRoot root: Bool = false, targetViewController: UIViewController? = nil) {
        guard let _r_w_c = UIDevice.current.keyWindow().rootViewController as? APPBasicTabBarViewController else {
            return
        }
        
        let _t_skw_viewcon = _r_w_c.jk.topViewController()
        
        if url.hasPrefix("http") {
            _t_skw_viewcon?.navigationController?.pushViewController(h5WebskwCoskwViewController(withWebLinkURL: APPPublicParams.request().splicingPublicParams(url), backToRoot: root, webFuncScriptHandler: webLuYousCallbakcMethods,), animated: true)
        } else {
            if url.contains(APP_SETTING) {
                _t_skw_viewcon?.navigationController?.pushViewController(SeskwkTingtingswkViewController(), animated: true)
            } else if url.contains(APP_HOME) {
                _r_w_c.selectedIndex = .zero
                _t_skw_viewcon?.navigationController?.popToRootViewController(animated: true)
            } else if url.contains(APP_LOGIN) {
                let _logks: EsensiilsaaJawwsNavViewController = EsensiilsaaJawwsNavViewController(rootViewController: DengluSkwkVndjsuViewController())
                _logks.modalPresentationStyle = .overFullScreen
                _t_skw_viewcon?.present(_logks, animated: true)
                _t_skw_viewcon?.navigationController?.popToRootViewController(animated: true)
            } else if url.contains(APP_PRODUCT) {
                _t_skw_viewcon?.navigationController?.pushViewController(LoaskwmDetasilwViewController(chansNumber: self.spesParamsw(url: url)), animated: true)
            } else if url.contains(APP_ORDER) {
                _r_w_c.selectedIndex = 1
                _t_skw_viewcon?.navigationController?.popToRootViewController(animated: true)
            } else {
                if let _t = targetViewController {
                    _t_skw_viewcon?.navigationController?.pushViewController(_t, animated: true)
                }
            }
        }
    }
}

private extension LuyouswkMakswTool {
    func spesParamsw(url: String) -> String {
        return url.components(separatedBy: "?").last?.components(separatedBy: "=").last ?? ""
    }
}
