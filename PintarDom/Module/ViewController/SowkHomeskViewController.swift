//
//  SowkHomeskViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class SowkHomeskViewController: EsensiilsadwsiwViewController {

    private lazy var topView: HomBigsTospCaPProskwView = HomBigsTospCaPProskwView(frame: CGRectZero)
    private lazy var appslwkView: HomApslwlkControwlView = HomApslwlkControwlView(frame: CGRectZero)
    private lazy var bigSkwi: HomBigskwCakswiView = HomBigskwCakswiView(frame: CGRectZero)
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.pageNetRequest()
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        NotificationCenter.default.addObserver(self, selector: #selector(reswoHomesUiStyle), name: NSNotification.Name("refreshHomeUI"), object: nil)
        self.bgImgView.image = UIImage(named: "home_bg")
        
        self.appslwkView.addTarget(self, action: #selector(clickAppslwjsViewsButon(sender: )), for: UIControl.Event.touchUpInside)
        
        self.basicScrollContentView.addSubview(self.topView)
        self.basicScrollContentView.addSubview(self.appslwkView)
        self.basicScrollContentView.addSubview(self.bigSkwi)
        // 缓存城市列表
        self.cacheLoaskwlCitySiwjd()
    }

    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.topView.snp.makeConstraints { make in
            make.left.width.equalToSuperview()
            make.top.equalToSuperview().offset(jk_kStatusBarFrameH)
        }
        
        self.appslwkView.snp.makeConstraints { make in
            make.left.width.equalToSuperview()
            make.top.equalTo(self.topView.snp.bottom)
        }
        
        self.bigSkwi.snp.makeConstraints { make in
            make.left.width.equalToSuperview()
            make.top.equalTo(self.appslwkView.snp.bottom).offset(14)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        self.refreshMineLocations()
        MaiDianwkToslwTool.maiDianLocationsReskws()
        MaiDianwkToslwTool.phoneDeviceInfo()
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            MaiDianwkToslwTool.IDFAAndIDFV()
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/bade", requestParams: [:])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _diskw = res.jsonDict, let _modsl = HomeDatsskwMoslw.model(withJSON: _diskw) else {
                return
            }
            
            _modsl.loanChanswFilters()
            
            if let _big = _modsl.bigDats {
                if let _url = _big.bless {
                    self?.topView.setPPimage(_url, ppname: _big.lifeless, serviceLosdkw: _modsl.conveying?.opportunity ?? "", serviweUrl: _modsl.conveying?.omit ?? "")
                }
                
                self?.appslwkView.reloadSowksInfp(model: _big)
                self?.appslwkView.animationBigOrSamll(isBig: true)
            }
            
            if let _small = _modsl.smallDats {
                if let _url = _small.bless {
                    self?.topView.setPPimage(_url, ppname: _small.lifeless, serviceLosdkw: _modsl.conveying?.opportunity ?? "", serviweUrl: _modsl.conveying?.omit ?? "")
                }
                
                self?.appslwkView.reloadSowksInfp(model: _small)
                self?.appslwkView.animationBigOrSamll(isBig: false)
            }
        }
    }
}

private extension SowkHomeskViewController {
    func cacheLoaskwlCitySiwjd() {
        #if DEBUG
        #else
        if GLoskwCommenskwmodls.shared.countryCode == 1 {
            return
        }
        #endif
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/conveying", requestParams: [:])) { (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _jsowDisek = res.jsonArray as? NSArray, let _json = _jsowDisek.modelToJSONString() else {
                return
            }
            
            InsjwjdCityCalswjCacheModel.saveCsitjwDataToDiskwks(_json)
        }
    }
}

@objc private extension SowkHomeskViewController {
    func clickAppslwjsViewsButon(sender: HomApslwlkControwlView) {
        
    }
    
    func reswoHomesUiStyle() {
        
    }
}
