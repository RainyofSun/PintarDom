//
//  h5WebskwCoskwViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit
import StoreKit

class h5WebskwCoskwViewController: APPWebController {

    private var mai_dian_time: String = ""
    
    override func hookMethodUI() {
        super.hookMethodUI()
        DeviceAuthorizationTool.authorization().requestDeviceLocation()
        self.view.backgroundColor = .white
        self.setProcessBarTrackColor(UIColor.ppGreen, tintColor: UIColor.ppBlue)
    }
    
    override func shouldPop() -> Bool {
        return self.webControllerCanPop()
    }
    
    override func hookMethodWebFuncCallback(_ funcName: String, funcParams: [String]) {
        super.hookMethodWebFuncCallback(funcName, funcParams: funcParams)
        
        APPCocoaLog.debug("JS 传输的方法：\(funcName), body = \(funcParams)")
        
        if funcName == CloseWebPage {
            let _ = self.shouldPop()
        }
        
        if funcName == PageTransitionNoParams {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: funcParams.first ?? "", needBackRoot: true)
        }
        
        if funcName == CloseAndGotoHome {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: APP_HOME)
        }
        
        if funcName == GotoAppStore {
            if #available(iOS 14.0, *) {
                if let scene = UIApplication.shared.currentScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            } else {
                SKStoreReviewController.requestReview()
            }
        }
        
        if funcName == ConfirmApplyBury {
            DeviceAuthorizationTool.authorization().requestDeviceLocation()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
                self.mai_dian_time = Date().jk.dateToTimeStamp()
                MaiDianwkToslwTool.fengKongMaidian(type: MaiDianEventUploadStyle.MD_EndAppply, beginTime: self.mai_dian_time, endTime: Date().jk.dateToTimeStamp(), orderNumber: GLoskwCommenskwmodls.shared.productOrderNum)
            })
        }
    }
}

extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes.first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}
