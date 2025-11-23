//
//  WinsLanscusherViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit
import FBSDKCoreKit

protocol WinLanswksDisProtocol: AnyObject {
    func lansudswErDismiss()
}

class WinsLanscusherViewController: EsensiilsadwsiwViewController {

    weak open var lansuwDelegate: WinLanswksDisProtocol?
    
    private lazy var tryswjBtn = APPActivityButton.buildLoadingAnimationButton(title: APPLanguageInsTool.loadLanguage("lunch_try"))

    override func buildPageUI() {
        super.buildPageUI()
        
        self.tryswjBtn.corner(25)
        self.tryswjBtn.layer.borderWidth = 1
        self.tryswjBtn.layer.borderColor = UIColor.white.cgColor
        self.tryswjBtn.addTarget(self, action: #selector(cliskwtrysuBuwson(sender: )), for: UIControl.Event.touchUpInside)
        self.tryswjBtn.isHidden = true
        
        self.bgImgView.image = UIImage(named: "launcher")
        self.view.addSubview(self.bgImgView)
        self.view.addSubview(self.tryswjBtn)
        
        NotificationCenter.default.addObserver(self, selector: #selector(phonesnWksChanges(sender: )), name: NSNotification.Name(APPLICATION_NET_CHANGE), object: nil)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.tryswjBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.pageNetRequest()
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
        if UIDevice.jk.isIpad() {
            let _skwimodel: AppChuShiMwoskModel = AppChuShiMwoskModel()
            _skwimodel.oppressed = "1"
            
            if let _code = _skwimodel.oppressed {
                GLoskwCommenskwmodls.shared.countryCode = Int(_code) ?? 1
                APPPublicParams.request().appUpdateLoginToken(nil, withContryCode: _code)
                APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.English)
            }
            self.lansuwDelegate?.lansudswErDismiss()
            return
        }
        
        let useVPnsjw: String = UIDevice.getProxyStatus("https://baidu.com") ? "1" : "0"
        let userYueyw: String = UIDevice.isVPNEnabled() ? "1" : "0"
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/wretchedness", requestParams: ["wretchedness": UIDevice.jk.appLanguage, "alas": useVPnsjw, "repose": userYueyw])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _dssd = res.jsonDict, let _initModel = AppChuShiMwoskModel.model(with: _dssd) else {
                return
            }
            
            GLoskwCommenskwmodls.shared.isAppInitializationSuccess = true
            GLoskwCommenskwmodls.shared.privacyURL = _initModel.privacyPolicyUrl
            
            if let _codes = _initModel.oppressed, let _code = Int(_codes) {
                GLoskwCommenskwmodls.shared.countryCode = _code
                APPPublicParams.request().appUpdateLoginToken(nil, withContryCode: _codes)
                if _code == 1 {
                    APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.English)
                }
                
                if _code == 2 {
                    APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.Indonesian)
                    
                    if (DeviceAuthorizationTool.authorization().locationAuthorization() != Authorized && DeviceAuthorizationTool.authorization().locationAuthorization() != Limited) {
                        GLoskwCommenskwmodls.shared.showPositionAlert = true
                    }
                }
            }
            
            self?.tryswjBtn.isHidden = true
            self?.lansuwDelegate?.lansudswErDismiss()
            
            #if DEBUG
            #else
            if let _f = _initModel.calmed {
                initialFB(_f)
            }
            #endif
        } failure: {[weak self] _, _ in
            self?.tryswjBtn.isHidden = false
            self?.loadMuwskrRequsUrls()
        }
    }
    
    @objc func cliskwtrysuBuwson(sender: APPActivityButton) {
        APPNetRequestURLConfig.clearDomainURLCache()
        self.pageNetRequest()
    }
    
    @objc func phonesnWksChanges(sender: Notification) {
        guard let _nsw_sta = sender.object as? DeviceNetObserver.NetworkStatus else {
            return
        }
        
        if _nsw_sta == .NetworkStatus_NoNet || _nsw_sta == .NetworkStatus_LTE {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("neiw_tswp"))
        } else {
            if APPInfomationCache.applicationFirstInstall() {
                self.pageNetRequest()
                DeviceNetObserver.shared.StopNetworkObserverListener()
                NotificationCenter.default.removeObserver(self)
            }
        }
    }
    
    private func initialFB(_ fbMols: CalmedInfo) {
        Settings.shared.appID = fbMols.exiled
        Settings.shared.displayName = fbMols.wanderer
        Settings.shared.clientToken = fbMols.blank
        Settings.shared.appURLSchemeSuffix = fbMols.held
        Settings.shared.isAutoLogAppEventsEnabled = true
        ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    }
    
    private func loadMuwskrRequsUrls() {
        let urlConswl: NetworkRequestConfig = NetworkRequestConfig.defaultRequestConfig(ke_bian_service_address + ke_bina_service_domain, requestParams: nil)
        urlConswl.requestType = .download
        
        APPNetRequestManager.afnReqeustType(urlConswl) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _swks = res.responseMsg, let _dow_modls = NSArray.modelArray(with: MutabslwDomainsasModel.self, json: _swks) as? [MutabslwDomainsasModel] else {
                return
            }
            
            for item in _dow_modls {
                if let _uslw = item.cp, APPNetRequestURLConfig.reloadNetworkRequestDomainURL(_uslw) {
                    APPNetRequestConfig.reloadNetworkRequestURL()
                    self?.pageNetRequest()
                    break
                }
            }
        }
    }
}
