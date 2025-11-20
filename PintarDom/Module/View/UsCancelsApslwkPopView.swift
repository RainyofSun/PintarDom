//
//  UsCancelsApslwkPopView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/21.
//

import UIKit

class UsCancelsApslwkPopView: EsensiwlwsBadisnPresentView {
    
    private lazy var tipLasw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_cancel_pop_tip1"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    
    private lazy var cswbhskwslView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.5)], gradientStyle: GradientDirectionStyle.leftToRight)
        view.corner(16)
        return view
    }()
    
    private lazy var tipsw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_cancel_pop_tip2"), t_color: UIColor.ppBlack66, t_f: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium))
    
    private lazy var siqkslas: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_cancel_pop_tip3"), t_color: UIColor.ppBlack66, t_f: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium))
    
    private lazy var rriwlqp: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_cancel_pop_tip4"), t_color: UIColor.ppBlack66, t_f: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium))
    
    private lazy var protcoplView: ProtocolView = ProtocolView(frame: CGRectZero)
    
    private lazy var logsbNt: APPActivityButton = {
        let view = APPActivityButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("setting_signout_pop_title"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        return view
    }()
    
    override func buildPresentView() {
        super.buildPresentView()

        self.titleLab.text = APPLanguageInsTool.loadLanguage("setting_cancel_pop_title")
        self.confirmBtn.setTitle(APPLanguageInsTool.loadLanguage("setting_signout_pop_btn"), for: UIControl.State.normal)
        self.confirmBtn.setBackgroundImage(UIImage(named: "cancel_sjw"), for: UIControl.State.normal)
                
        self.contentView.addSubview(self.tipLasw)
        self.contentView.addSubview(self.cswbhskwslView)
        self.cswbhskwslView.addSubview(self.tipsw)
        self.cswbhskwslView.addSubview(self.siqkslas)
        self.cswbhskwslView.addSubview(self.rriwlqp)
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
        
        self.siqkslas.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.jsowbisnalabe.snp.bottom).offset(6)
            make.bottom.lessThanOrEqualTo(self.confirmBtn.snp.top).offset(-35)
        }
        
        self.rriwlqp.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        
        self.logsbNt.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.contentView)
            make.top.equalTo(self.confirmBtn.snp.bottom).offset(12)
            make.height.equalTo(40)
        }
    }
}
