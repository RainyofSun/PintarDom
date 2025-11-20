//
//  SetisnLogouswPopView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/20.
//

import UIKit

class SetisnLogouswPopView: EsensiwlwsBadisnPresentView {

    private lazy var tipLasw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip1"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    
    private lazy var cswbhskwslView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.5)], gradientStyle: GradientDirectionStyle.leftToRight)
        view.corner(16)
        return view
    }()
    
    private lazy var tipsw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip2"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium))
    private lazy var jsowbisnalabe: JianBianLab = {
        let view = JianBianLab(frame: CGRectZero)
        view.gradientColors = [UIColor.hexStringColor(hexString: "#0972A4"), UIColor.hexStringColor(hexString: "#0972A4")]
        view.strokeColor = UIColor.white
        view.strokeWidth = 5
        view.text = APPLanguageInsTool.loadLanguage("setting_signout_pop_tip3")
        return view
    }()
    private lazy var siqkslas: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip4"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium))
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("setting_signout_pop_title")
        self.confirmBtn.setTitle(APPLanguageInsTool.loadLanguage("setting_signout_pop_tip5"), for: UIControl.State.normal)
        
        self.contentView.addSubview(self.tipLasw)
        self.contentView.addSubview(self.cswbhskwslView)
        self.cswbhskwslView.addSubview(self.tipsw)
        self.cswbhskwslView.addSubview(self.jsowbisnalabe)
        self.cswbhskwslView.addSubview(self.siqkslas)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.tipLasw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.top.equalTo(self.titleLab.snp.bottom).offset(34)
        }
        
        self.cswbhskwslView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(self.tipLasw.snp.bottom).offset(20)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-18)
        }
        
        self.tipsw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        self.jsowbisnalabe.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.tipsw.snp.bottom).offset(5)
        }
        
        self.siqkslas.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.jsowbisnalabe.snp.bottom).offset(6)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        
    }
}
