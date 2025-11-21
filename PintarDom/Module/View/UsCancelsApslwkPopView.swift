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
    
    private(set) lazy var protcoplView: ProtocolView = ProtocolView(frame: CGRectZero)
    
    override func buildPresentView() {
        super.buildPresentView()

        self.tipLasw.textAlignment = .left
        self.tipsw.textAlignment = .left
        self.siqkslas.textAlignment = .left
        self.rriwlqp.textAlignment = .left
        
        self.protcoplView.setAgreeButton(UIImage(named: "login_unsel")!, selectedImg: UIImage(named: "login_sel")!)
        self.protcoplView.setProtocol(NSAttributedString(string: APPLanguageInsTool.loadLanguage("setting_cancel_pop_tip5"), attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.ppBlack33]), protocolPrefix: NSAttributedString(),defaultSelected: false)
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("setting_cancel_pop_title")
        self.confirmBtn.setTitle(APPLanguageInsTool.loadLanguage("setting_cancel_pop_btn"), for: UIControl.State.normal)
        self.confirmBtn.setBackgroundImage(UIImage(named: "cancel_sjw"), for: UIControl.State.normal)
        self.confirmBtn.setBackgroundImage(UIImage(named: "cancel_sjw"), for: UIControl.State.highlighted)
        self.confirmBtn.setBackgroundImage(UIImage(named: "cancel_sjw"), for: UIControl.State.disabled)
        
        self.contentView.addSubview(self.tipLasw)
        self.contentView.addSubview(self.cswbhskwslView)
        self.cswbhskwslView.addSubview(self.tipsw)
        self.cswbhskwslView.addSubview(self.siqkslas)
        self.cswbhskwslView.addSubview(self.rriwlqp)
        self.contentView.addSubview(self.protcoplView)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.tipLasw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(self.titleLab.snp.bottom).offset(34)
        }
        
        self.cswbhskwslView.snp.makeConstraints { make in
            make.top.equalTo(self.tipLasw.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-30)
        }
        
        self.protcoplView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.cswbhskwslView)
            make.top.equalTo(self.cswbhskwslView.snp.bottom).offset(8)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-10)
        }
        
        self.tipsw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        self.siqkslas.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.tipsw)
            make.top.equalTo(self.tipsw.snp.bottom).offset(12)
        }
        
        self.rriwlqp.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.siqkslas)
            make.top.equalTo(self.siqkslas.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
