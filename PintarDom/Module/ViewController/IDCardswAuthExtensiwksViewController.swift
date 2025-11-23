//
//  IDCardswAuthExtensiwksViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class IDCardswAuthExtensiwksViewController: AuthExtensiwksViewController {

    private lazy var cardausjwView: CardLoaskwAuthView = CardLoaskwAuthView(frame: CGRectZero, isFace: false)
    private lazy var faceausjwView: CardLoaskwAuthView = CardLoaskwAuthView(frame: CGRectZero, isFace: true)
    private lazy var mediaTolle: APPMultimediaTool = APPMultimediaTool(presentViewController: self)
    private var cardAuthComplete: Bool = false
    private var faceAuthComplete: Bool = false
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.cardausjwView.addTarget(self, action: #selector(clickCardAuth(sender: )), for: UIControl.Event.touchUpInside)
        self.faceausjwView.addTarget(self, action: #selector(clickFaceAuth(sender: )), for: UIControl.Event.touchUpInside)
        
        self.mediaTolle.toolDelegate = self
        self.basicScrollContentView.addSubview(self.cardausjwView)
        self.basicScrollContentView.addSubview(self.faceausjwView)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.cardausjwView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(41)
            make.left.width.equalToSuperview()
        }
        
        self.faceausjwView.snp.makeConstraints { make in
            make.top.equalTo(self.cardausjwView.snp.bottom).offset(12)
            make.left.width.equalTo(self.cardausjwView)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/held", requestParams: ["nor": self.comsejDityID])) { [weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _jsow = res.jsonDict, let _cas_model = CardAushwModel.model(with: _jsow) else {
                return
            }
            
            self?.isCompleteAuth = _cas_model.unaffected?.attainable == 1
            
            self?.cardausjwView.tipLasbw.text = _cas_model.unaffected?.brooded
            self?.faceausjwView.tipLasbw.text = _cas_model.unaffected?.suggestion
            
            if let _card_url = _cas_model.unaffected?.mere, !_card_url.isEmpty {
                self?.cardAuthComplete = true
                self?.cardausjwView.uspwTipwslLab.text = APPLanguageInsTool.loadLanguage("auth_uploaded")
                self?.cardausjwView.updalwTpwImg.image = UIImage(named: "auth_cowms")
                if let _url = URL(string: _card_url) {
                    self?.cardausjwView.temslwImgView.setImageWith(_url, options: YYWebImageOptions.setImageWithFadeAnimation)
                }
            }
            
            if let _face_url = _cas_model.unaffected?.conquest, !_face_url.isEmpty {
                self?.faceAuthComplete = true
                self?.faceausjwView.uspwTipwslLab.text = APPLanguageInsTool.loadLanguage("auth_uploaded")
                self?.faceausjwView.updalwTpwImg.image = UIImage(named: "auth_cowms")
                if let _url = URL(string: _face_url) {
                    self?.faceausjwView.temslwImgView.setImageWith(_url, options: YYWebImageOptions.setImageWithFadeAnimation)
                }
            }
        }
    }
    
    override func clickNextButtons(sender: APPActivityButton) {
        super.clickNextButtons(sender: sender)
        
        if !self.cardAuthComplete {
            self.clickCardAuth(sender: self.cardausjwView)
            return
        }
        
        if !self.faceAuthComplete {
            self.clickFaceAuth(sender: self.faceausjwView)
            return
        }
        
        if let _title = self._next_tilskw_map?[self._next_type]?["title"] {
            self.navigationController?.jk.popCurrentAndPush(vc: InfoAushPospwViewViewController(cerasauAutheTiel: _title, nexjsAujwTheielw: self._next_tilskw_map, authStyle: (ChanPinAuthElement.Certif_Persopalsjnal_Inuywjfo, ChanPinAuthElement.Certif_Job_Info)), animated: true)
        }
    }
}

@objc private extension IDCardswAuthExtensiwksViewController {
    func clickCardAuth(sender: CardLoaskwAuthView) {
        guard !self.cardAuthComplete else {
            return
        }
        
        self.refreshMineLocations()
        let ppViwks: CardAushPospwView = CardAushPospwView(frame: CGRectZero)
        UIDevice.current.keyWindow().addSubview(ppViwks)
        ppViwks.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        ppViwks.showPresent()
        
        ppViwks.clickConfirmClosure = { [weak self] (popi: EsensiwlwsBadisnPresentView, sender: APPActivityButton) in
            sender.isEnabled = false
            self?.buryingStartTime = Date().jk.dateToTimeStamp()
            self?.mediaTolle.takingPhoto(false)
            popi.dismissPop()
        }
    }
    
    func clickFaceAuth(sender: CardLoaskwAuthView) {
        guard self.cardAuthComplete else {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("auth_card_tis"))
            return
        }
        
        guard !self.faceAuthComplete else {
            return
        }
        
        self.refreshMineLocations()
        let ppViwks: FaceAushPospwView = FaceAushPospwView(frame: CGRectZero)
        UIDevice.current.keyWindow().addSubview(ppViwks)
        ppViwks.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        ppViwks.showPresent()
        
        ppViwks.clickConfirmClosure = { [weak self] (popi: EsensiwlwsBadisnPresentView, sender: APPActivityButton) in
            sender.isEnabled = false
            self?.buryingStartTime = Date().jk.dateToTimeStamp()
            self?.mediaTolle.takingPhoto(true)
            popi.dismissPop()
        }
    }
}

private extension IDCardswAuthExtensiwksViewController {
    func uploasdPicture(_ file: String) {
        if !FileManager.default.fileExists(atPath: file) {
            return
        }
        
        self.view.makeToastActivity(CSToastPositionCenter)
        let updalwoPaeawk: [String: String] = ["influence": "1", "fainted": self.cardAuthComplete ? "10" : "11", "images": file]
        let config: NetworkRequestConfig = NetworkRequestConfig.defaultRequestConfig("qscgy/exiled", requestParams: updalwoPaeawk)
        config.requestType = .upload
        APPNetRequestManager.afnReqeustType(config) { [weak self] (task: URLSessionDataTask, red: APPSuccessResponse) in
            guard let _self_ss = self else {
                return
            }
            
            _self_ss.view.hideToastActivity()
            if _self_ss.cardAuthComplete && !_self_ss.faceAuthComplete {
                _self_ss.faceausjwView.isEnabled = true
                self?.refreshMineLocations()
                MaiDianwkToslwTool.fengKongMaidian(type: MaiDianEventUploadStyle.MD_TakingFace, beginTime: _self_ss.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
                if let _title = _self_ss._next_tilskw_map?[_self_ss._next_type]?["title"] {
                    _self_ss.navigationController?.jk.popCurrentAndPush(vc: InfoAushPospwViewViewController(cerasauAutheTiel: _title, nexjsAujwTheielw: _self_ss._next_tilskw_map, authStyle: (ChanPinAuthElement.Certif_Persopalsjnal_Inuywjfo, ChanPinAuthElement.Certif_Job_Info)), animated: true)
                }
                return
            }
            
            if !_self_ss.cardAuthComplete {
                _self_ss.cardausjwView.isEnabled = true
                guard let _jso = red.jsonDict, let _swol = CardAuthwPwekskModel.model(with: _jso), let _vaslw = _swol.vague else {
                    return
                }
                
                if let _uskwl = _swol.img_url {
                    if let _url = URL(string: _uskwl) {
                        _self_ss.cardausjwView.temslwImgView.setImageWith(_url, options: YYWebImageOptions.setImageWithFadeAnimation)
                    }
                }
                
                let pppwlsView: CardAuthwPwekskPopView = CardAuthwPwekskPopView(frame: CGRectZero)
                pppwlsView.buildItemView(deols: _vaslw)
                UIDevice.current.keyWindow().addSubview(pppwlsView)
                pppwlsView.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
                
                pppwlsView.showPresent()
                
                pppwlsView.clickConfirmClosure = { (popi: EsensiwlwsBadisnPresentView, sender: APPActivityButton) in
                    guard let _pwls = popi as? CardAuthwPwekskPopView, !_pwls.savepashw.isEmpty else {
                        return
                    }
                    sender.startAnimation()
                    _pwls.savepashw["nor"] = self?.comsejDityID
                    
                    APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/wanderer", requestParams: _pwls.savepashw)) { (task: URLSessionDataTask, red: APPSuccessResponse) in
                        _self_ss.cardausjwView.uspwTipwslLab.text = APPLanguageInsTool.loadLanguage("auth_uploaded")
                        _self_ss.cardausjwView.updalwTpwImg.image = UIImage(named: "auth_cowms")
                        sender.stopAnimation()
                        MaiDianwkToslwTool.fengKongMaidian(type: MaiDianEventUploadStyle.MD_IDCardAlert, beginTime: _self_ss.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
                        popi.dismissPop()
                        _self_ss.cardAuthComplete = true
                    }
                }
            }
        } failure: {[weak self] _, _ in
            self?.view.hideToastActivity()
            self?.cardausjwView.isEnabled = true
            self?.faceausjwView.isEnabled = true
        }
    }
}

extension IDCardswAuthExtensiwksViewController: APPMultimediaProtocol {
    func selectedPictureFormMultimediaComplete(_ filePath: String) {
        self.uploasdPicture(filePath)
    }
}
