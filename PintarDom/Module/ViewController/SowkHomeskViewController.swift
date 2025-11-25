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
    private lazy var smallSkws: SmallCakswkViwskw = SmallCakswkViwskw(frame: CGRectZero)
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.pageNetRequest()
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        NotificationCenter.default.addObserver(self, selector: #selector(reswoHomesUiStyle), name: NSNotification.Name("refreshHomeUI"), object: nil)
        self.bgImgView.image = UIImage(named: "home_bg")
        
        self.appslwkView.addTarget(self, action: #selector(clickAppslwjsViewsButon(sender: )), for: UIControl.Event.touchUpInside)
        
        self.smallSkws.isHidden = true
        self.smallSkws.smlaDelegate = self
        self.basicScrollContentView.addSubview(self.topView)
        self.basicScrollContentView.addSubview(self.appslwkView)
        
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
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(jk_kScreenW - 32)
            make.top.equalTo(self.topView.snp.bottom)
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
                
                if let _assuw = _modsl.assume {
                    self?.bigSkwi.priswhUrl = _assuw.stopping
                }
                
                self?.loadCadedsViews(isBig: true)
                
                self?.appslwkView.reloadSowksInfp(model: _big)
                self?.appslwkView.animationBigOrSamll(isBig: true)
                GLoskwCommenskwmodls.shared.productID = _big.bosom
            }
            
            if let _small = _modsl.smallDats {
                if let _url = _small.bless {
                    self?.topView.setPPimage(_url, ppname: _small.lifeless, serviceLosdkw: _modsl.conveying?.opportunity ?? "", serviweUrl: _modsl.conveying?.omit ?? "")
                }
                
                self?.loadCadedsViews(isBig: false)
                self?.appslwkView.reloadSowksInfp(model: _small)
                self?.appslwkView.animationBigOrSamll(isBig: false)
                GLoskwCommenskwmodls.shared.productID = _small.bosom
                if let _dds = _modsl.loadLis {
                    self?.smallSkws.reloadSamlwslSource(sourve: _dds)
                }
            }
        }
    }
    
    func loadCadedsViews(isBig: Bool) {
        self.bigSkwi.isHidden = !isBig
        self.smallSkws.isHidden = isBig
        
        if isBig {
            self.smallSkws.removeFromSuperview()
            self.basicScrollContentView.addSubview(self.bigSkwi)
            
            UIView.animate(withDuration: 0.3) {
                self.appslwkView.snp.remakeConstraints { make in
                    make.left.equalToSuperview().offset(16)
                    make.width.equalTo(jk_kScreenW - 32)
                    make.top.equalTo(self.topView.snp.bottom)
                }
                
                self.bigSkwi.snp.remakeConstraints { make in
                    make.left.width.equalToSuperview()
                    make.top.equalTo(self.appslwkView.snp.bottom).offset(14)
                    make.bottom.equalToSuperview().offset(-20)
                }
                
                self.basicScrollContentView.layoutIfNeeded()
            }
        } else {
            self.bigSkwi.removeFromSuperview()
            self.basicScrollContentView.addSubview(self.smallSkws)
            
            UIView.animate(withDuration: 0.3) {
                self.appslwkView.snp.remakeConstraints { make in
                    make.left.equalToSuperview().offset(16)
                    make.width.equalTo(jk_kScreenW - 32)
                    make.top.equalTo(self.topView.snp.bottom)
                }
                
                self.smallSkws.snp.remakeConstraints { make in
                    make.left.width.equalToSuperview()
                    make.top.equalTo(self.appslwkView.snp.bottom).offset(14)
                    make.height.equalTo(jk_kScreenH - 420)
                    make.bottom.equalToSuperview().offset(-20)
                }
                
                self.basicScrollContentView.layoutIfNeeded()
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
    
    func showChanpInsDetail(_ chanPinswkId: String, sender: ActivityAnimationProtocol) {
        guard sender.isEnabled else {
            return
        }
        
        sender.startAnimation()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/oppressed", requestParams: ["nor": chanPinswkId])) { (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            guard let _jsowDis = res.jsonDict, let _ausjw_askkw = ChanPinZhunRuModelskw.model(with: _jsowDis) else {
                return
            }
            
            guard let _urls = _ausjw_askkw.totally else {
                return
            }
            
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _urls, needBackRoot: true)
            
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
}

@objc private extension SowkHomeskViewController {
    func clickAppslwjsViewsButon(sender: HomApslwlkControwlView) {
        self.showChanpInsDetail(self.comsejDityID, sender: sender.appBtn)
    }
    
    func reswoHomesUiStyle() {
        self.pageNetRequest()
    }
}

extension SowkHomeskViewController: SmalwlsCardPowksProtocol {
    func didSlskwkProdyctItem(sender: APPActivityButton, chanpinId: String) {
        self.showChanpInsDetail(chanpinId, sender: sender)
    }
}
