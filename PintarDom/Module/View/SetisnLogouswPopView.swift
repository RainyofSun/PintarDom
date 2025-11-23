//
//  SetisnLogouswPopView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/20.
//

import UIKit

class SetisnLogouswPopView: EsensiwlwsBadisnPresentView {

    open var clickLogoutClosure: ((SetisnLogouswPopView, APPActivityButton) -> Void)?
    
    private lazy var tipLasw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip1"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    
    private lazy var tipsw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip2"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium))
    private lazy var jsowbisnalabe: JianBianLab = {
        let view = JianBianLab(frame: CGRectZero)
        view.gradientColors = [UIColor.hexStringColor(hexString: "#0972A4"), UIColor.hexStringColor(hexString: "#0972A4")]
        view.strokeColor = UIColor.white
        view.strokeWidth = 15
        view.text = APPLanguageInsTool.loadLanguage("setting_signout_pop_tip3")
        view.font = UIFont.loadSpecialFont(size: 40, ftStyle: FontStyle.Inter_ExtraBold)
        return view
    }()
    
    private lazy var siqkslas: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip4"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    
    private lazy var logsbNt: APPActivityButton = {
        let view = APPActivityButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("setting_signout_pop_title"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        return view
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        self.contentView.image = UIImage(named: "login_bg_c_sml")
        self.titleLab.text = APPLanguageInsTool.loadLanguage("setting_signout_pop_title")
        self.confirmBtn.setTitle(APPLanguageInsTool.loadLanguage("setting_signout_pop_btn"), for: UIControl.State.normal)
        
        self.logsbNt.addTarget(self, action: #selector(clickLsowkOutBrn(sender: )), for: UIControl.Event.touchUpInside)
        
        self.contentView.addSubview(self.tipLasw)
        self.contentView.addSubview(self.tipsw)
        self.contentView.addSubview(self.jsowbisnalabe)
        self.contentView.addSubview(self.siqkslas)
        self.addSubview(self.logsbNt)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.tipLasw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.top.equalTo(self.titleLab.snp.bottom).offset(34)
        }
        
        self.tipsw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.tipLasw.snp.bottom).offset(35)
        }
        
        self.jsowbisnalabe.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.tipsw.snp.bottom).offset(5)
        }
        
        self.siqkslas.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.jsowbisnalabe.snp.bottom).offset(9)
            make.bottom.lessThanOrEqualTo(self.confirmBtn.snp.top).offset(-35)
        }
        
        self.logsbNt.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.contentView)
            make.top.equalTo(self.confirmBtn.snp.bottom).offset(12)
            make.height.equalTo(40)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        super.confirmClick(sender: sender)
        self.dismissPop()
    }
}

@objc private extension SetisnLogouswPopView {
    func clickLsowkOutBrn(sender: APPActivityButton) {
        self.clickLogoutClosure?(self, sender)
    }
}
