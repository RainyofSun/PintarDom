//
//  SceneDelegate.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/12.
//

import UIKit
@_exported import CYSwiftExtension
@_exported import Toast

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        APPNetRequestURLConfig.setNetworkDebugRequestURL("http://149.129.233.8:5010/asutf/", releaseUrl: "http://149.129.233.8:5010/asutf/")
        APPNetResponseParsingConfig.setParsingConfig("fainter", service: "sounds", data: "bade")
        setServiwComskwCnsParams()
        #if DEBUG
        APPCocoaLog.shared.registe(with: EnvType.other)
        #else
        APPCocoaLog.shared.registe(with: EnvType.prod)
        #endif
        DeviceNetObserver.shared.StartNetworkStatusListener()
        DeviceAuthorizationTool.authorization()
        APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.English)
        GLoskwCommenskwmodls.shared.unencodeuasdwyruenyws()
        setServiwComskwCnsParams()
        setWindowksRootSjwjvCOntrols()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        self.persiDevidesAuthswksModwj()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func showAllFonts(){
        let familyNames = UIFont.familyNames
        
        var index:Int = 0
        
        for familyName in familyNames {
            
            let fontNames = UIFont.fontNames(forFamilyName: familyName as String)
            print("------- 字体家族 -------- \(familyName)")
            for fontName in fontNames
            {
                index += 1
                
                print("第 \(index) 个字体，字体font名称：\(fontName)")
            }
        }
    }

    func setServiwComskwCnsParams() {
        let ppParams: APPPublicParamsKey = APPPublicParamsKey()
        ppParams.appVersionKey = "lamenting"
        ppParams.countryCodeKey = "oppressed"
        ppParams.deviceNameKey = "meeting"
        ppParams.idfaKey = "struggle"
        ppParams.idfvKey = "assertion"
        ppParams.loginTokenKey = "powerfully"
        ppParams.systemVersionKey = "support"
        
        APPPublicParams.request().appCommonParamsKeyModel(ppParams)
    }
}

extension SceneDelegate {
    func setWindowksRootSjwjvCOntrols() {
        CSToastManager.setDefaultPosition(CSToastPositionCenter)
        
        self.window?.backgroundColor = .white
        let lasn = WinsLanscusherViewController()
        lasn.lansuwDelegate = self
        self.window?.rootViewController = lasn
        self.window?.makeKeyAndVisible()
    }
    
    func persiDevidesAuthswksModwj() {
        DeviceAuthorizationTool.authorization().requestDeviceIDFAAuthrization { _ in
            
        }
        
        DeviceAuthorizationTool.authorization().requestDeviceLocationAuthrization(WhenInUse)
        
        if DeviceAuthorizationTool.authorization().locationAuthorization() == Authorized ||
            DeviceAuthorizationTool.authorization().locationAuthorization() == Limited {
            if GLoskwCommenskwmodls.shared.isAppInitializationSuccess {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    APPCocoaLog.debug("定位埋点上报 ---------")
                    MaiDianwkToslwTool.maiDianLocationsReskws()
                })
            }
        }
        
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            if GLoskwCommenskwmodls.shared.isAppInitializationSuccess {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    APPCocoaLog.debug("ATT 埋点上报 ---------")
                    MaiDianwkToslwTool.IDFAAndIDFV()
                })
            }
        }
        
        if GLoskwCommenskwmodls.shared.isAppInitializationSuccess {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                APPCocoaLog.debug("设备信息埋点上报 ---------")
                MaiDianwkToslwTool.phoneDeviceInfo()
            })
        }
    }
}

extension SceneDelegate: WinLanswksDisProtocol {
    func lansudswErDismiss() {
        let trans = CATransition()
        trans.duration = 0.5
        trans.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        trans.type = .fade
        self.window?.layer.add(trans, forKey: nil)
        self.window?.rootViewController = APPBasicTabBarViewController(controllers: [SowkHomeskViewController.self, OrdekswOrksjwPskViewController.self, MeSkwoledkwlViewController.self], barImages: [["home-filled_nor", "credit-card_nor", "user-nor"], ["home-filled", "credit-card_sel", "user-outline"]])
    }
}
