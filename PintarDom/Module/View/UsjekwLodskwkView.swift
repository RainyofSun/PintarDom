//
//  UsjekwLodskwkView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/19.
//

import UIKit

class UsjekwLodskwkView: EsensiwlwsBadisnPresentView {

    weak open var f_weak_conrolw: EsensiilsadwsiwViewController?
    
    private lazy var phoensNmsLab: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("login_phone"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    
    private lazy var phoeView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.5)], gradientStyle: GradientDirectionStyle.leftToRight)
        view.corner(16)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var areaNumsLab: UILabel = UILabel.normalTextLabel("(+91)", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium))
    private lazy var lineViws: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
        return view
    }()
    
    private lazy var phonestesw: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_phone_place"), attributes: [.font: UIFont.loadSpecialFont(size: 12, ftStyle: FontStyle.Inter_Medium), .foregroundColor: UIColor.ppBlack33.withAlphaComponent(0.6)])
        return view
    }()
    
    private lazy var codslwgraisView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.5)], gradientStyle: GradientDirectionStyle.leftToRight)
        view.corner(16)
        view.isUserInteractionEnabled = true
        return view
    }()
    private lazy var codekasw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("login_code"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    private lazy var codeTesjwView: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_code_place"), attributes: [.font: UIFont.loadSpecialFont(size: 12, ftStyle: FontStyle.Inter_Medium), .foregroundColor: UIColor.ppBlack33.withAlphaComponent(0.6)])
        return view
    }()
    
    private lazy var codeBtnsw: APPCodeTimerButton = {
        let view = APPCodeTimerButton(frame: CGRectZero)
        view.setTimerButtonTitle(APPLanguageInsTool.loadLanguage("login_sms_code"), titleColor: UIColor.hexStringColor(hexString: "#0972A4"))
        return view
    }()
    
    private lazy var voiceSkwBtnws: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        let attswjs: NSAttributedString = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_voice"), attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium), .foregroundColor: UIColor.hexStringColor(hexString: "#0972A4"), .underlineColor: UIColor.hexStringColor(hexString: "#0972A4"), .underlineStyle: NSUnderlineStyle.single])
        view.setAttributedTitle(attswjs, for: UIControl.State.normal)
        return view
    }()
    
    private lazy var protcoplView: ProtocolView = {
        let view = ProtocolView(frame: CGRectZero)
        view.setProtocol(NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_xie_yi"), attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium),.foregroundColor: UIColor.hexStringColor(hexString: "#0972A4")]), protocolPrefix: NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_xie_yi_pre"), attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium), .foregroundColor: UIColor.hexStringColor(hexString: "#6D6D73")]))
        return view
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("login_title")
        self.confirmBtn.setTitle(APPLanguageInsTool.loadLanguage("login_login"), for: UIControl.State.normal)
        
        self.voiceSkwBtnws.addTarget(self, action: #selector(clickVoiceskBuwjs(sender: )), for: UIControl.Event.touchUpInside)
        self.codeBtnsw.addTarget(self, action: #selector(clickCodesButnsw(sender: )), for: UIControl.Event.touchUpInside)
        
        self.protcoplView.protocolDelegate = self
        
        self.contentView.addSubview(self.phoensNmsLab)
        self.contentView.addSubview(self.phoeView)
        self.phoeView.addSubview(self.areaNumsLab)
        self.phoeView.addSubview(self.lineViws)
        self.phoeView.addSubview(self.phonestesw)
        self.contentView.addSubview(self.codekasw)
        self.contentView.addSubview(self.codslwgraisView)
        self.codslwgraisView.addSubview(self.codeTesjwView)
        self.codslwgraisView.addSubview(self.codeBtnsw)
        self.contentView.addSubview(self.voiceSkwBtnws)
        self.contentView.addSubview(self.protcoplView)
        
        if let _t = UserDefaults.standard.string(forKey: "userPhone") {
            self.phonestesw.text = _t
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6, execute: {
                if self.phonestesw.canBecomeFirstResponder {
                    self.phonestesw.becomeFirstResponder()
                }
            })
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6, execute: {
                if self.phonestesw.canBecomeFirstResponder {
                    self.phonestesw.becomeFirstResponder()
                }
            })
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.phoensNmsLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(self.titleLab.snp.bottom).offset(50)
        }
        
        self.phoeView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(self.phoensNmsLab.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
        
        self.areaNumsLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        self.lineViws.snp.makeConstraints { make in
            make.left.equalTo(self.areaNumsLab.snp.right).offset(14)
            make.verticalEdges.equalToSuperview().inset(10)
            make.width.equalTo(1)
        }
        
        self.phonestesw.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(3)
            make.left.equalTo(self.lineViws.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        self.codekasw.snp.makeConstraints { make in
            make.top.equalTo(self.phoeView.snp.bottom).offset(14)
            make.left.equalTo(self.phoeView)
        }
        
        self.codslwgraisView.snp.makeConstraints { make in
            make.horizontalEdges.height.equalTo(self.phoeView)
            make.top.equalTo(self.codekasw.snp.bottom).offset(8)
        }
        
        self.codeTesjwView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.verticalEdges.equalToSuperview().inset(3)
            make.right.equalTo(self.codeBtnsw.snp.left).offset(8)
        }
        
        self.codeBtnsw.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.verticalEdges.equalToSuperview().inset(3)
            make.width.greaterThanOrEqualTo(80)
        }
        
        self.voiceSkwBtnws.snp.makeConstraints { make in
            make.centerX.equalTo(self.codslwgraisView)
            make.top.equalTo(self.codslwgraisView.snp.bottom).offset(14)
        }
        
        self.protcoplView.snp.makeConstraints { make in
            make.horizontalEdges.lessThanOrEqualTo(self.codslwgraisView).inset(40)
            make.top.equalTo(self.voiceSkwBtnws.snp.bottom).offset(50)
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(self.protcoplView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func closePresentView() {
        self.codeBtnsw.initCodeTimerStatus()
        NotificationCenter.default.post(name: NSNotification.Name.init("refreshHome"), object: nil)
        self.f_weak_conrolw?.dismiss(animated: true)
    }
    
    override func confirmClick(sender: APPActivityButton) {
        guard self.protcoplView.hasSelected else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_yinsi"))
            return
        }
        
        guard let _t_phone = self.phonestesw.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_phone_p"))
            return
        }
        
        guard let _c_code = self.codeTesjwView.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_v_code_t"))
            return
        }
        
        sender.startAnimation()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/fainter", requestParams: ["next":_t_phone, "difference": _c_code])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            guard let _jsw = res.jsonDict else {
                return
            }
            
            GLoskwCommenskwmodls.shared.appLoginInfo = PersonalsInsdoModel.model(with: _jsw)
            UserDefaults.standard.set(GLoskwCommenskwmodls.shared.appLoginInfo?.next, forKey: "userPhone")
            UserDefaults.standard.synchronize()
            GLoskwCommenskwmodls.shared.encoderukpersinwoinfoToDskkd()
            MaiDianwkToslwTool.fengKongMaidian(type: MaiDianEventUploadStyle.MD_Login, beginTime: self?.f_weak_conrolw?.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
            self?.codeBtnsw.stop()
            self?.closePresentView()
        } failure: {[weak self] _, _ in
            sender.stopAnimation()
            self?.codeTesjwView.jk.shake(times: 5, interval: 0.04) {
                self?.codeTesjwView.text = ""
                if let _v = self?.codeTesjwView.canBecomeFirstResponder, _v {
                    self?.codeTesjwView.becomeFirstResponder()
                }
            }
        }
    }
}

@objc private extension UsjekwLodskwkView {
    func clickVoiceskBuwjs(sender: UIButton) {
        guard let _t_phone = self.phonestesw.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_phone_p"))
            return
        }
        
        sender.isEnabled = false
        self.f_weak_conrolw?.buryingStartTime = Date().jk.dateToTimeStamp()
        self.makeToastActivity(CSToastPositionCenter)
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/repose", requestParams: ["behold": _t_phone])) {[weak self] _, res in
            sender.isEnabled = true
            self?.hideToastActivity()
            self?.makeToast(res.responseMsg ?? "")
            
            if let _v = self?.codeTesjwView.canBecomeFirstResponder, _v {
                self?.codeTesjwView.becomeFirstResponder()
            }
        } failure: {[weak self] _, _ in
            sender.isEnabled = true
            self?.hideToastActivity()
        }
    }
    
    func clickCodesButnsw(sender: APPCodeTimerButton) {
        guard let _t_phone = self.phonestesw.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_phone_p"))
            return
        }
        
        sender.isEnabled = false
        self.f_weak_conrolw?.buryingStartTime = Date().jk.dateToTimeStamp()
        self.makeToastActivity(CSToastPositionCenter)
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("qscgy/alas", requestParams: ["behold": _t_phone])) {[weak self] (task, res) in
            sender.isEnabled = true
            self?.hideToastActivity()
            sender.start()
            self?.makeToast(res.responseMsg ?? "")
            
            if let _v = self?.codeTesjwView.canBecomeFirstResponder, _v {
                self?.codeTesjwView.becomeFirstResponder()
            }
        } failure: {[weak self] _, _ in
            sender.isEnabled = true
            self?.hideToastActivity()
        }
    }
}

extension EsensiwlwsBadisnPresentView: APPProtocolDelegate {
    func gotoProtocol() {
        if let url = GLoskwCommenskwmodls.shared.privacyURL {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: url, needBackRoot: true)
        }
    }
}
