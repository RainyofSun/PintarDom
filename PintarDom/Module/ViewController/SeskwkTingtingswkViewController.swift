//
//  SeskwkTingtingswkViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit

class SeskwkTingtingswkViewController: EsensiilsadwsiwViewController {

    private lazy var logosImagw: UIImageView = UIImageView(image: UIImage(named: "home_logo"))
    private lazy var versionLabe: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_version"), t_color: UIColor.hexStringColor(hexString: "#8E8E93"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var logoName: UILabel = UILabel.normalTextLabel(Bundle.jk.appDisplayName, t_color: UIColor.hexStringColor(hexString: "#0993D5"), t_f: UIFont.loadSpecialFont(size: 20, ftStyle: FontStyle.Inter_ExtraBold))
    
    private lazy var whiteBgskwConw: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.4)
        view.corner(16)
        return view
    }()
    
    private lazy var cancelslView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.5)], gradientStyle: GradientDirectionStyle.leftToRight)
        view.corner(16)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var canslelBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setImage(UIImage(named: "setting_exit"), for: UIControl.State.normal)
        view.setTitle(APPLanguageInsTool.loadLanguage("setting_cancel"), for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        view.setTitleColor(UIColor.ppBlack33, for: UIControl.State.normal)
        view.isUserInteractionEnabled = false
        view.layoutImageUpTitleDown()
        view.titleLabel?.numberOfLines = 0
        view.titleLabel?.textAlignment = .center
        return view
    }()
    
    private lazy var signaouwView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#70FFE5", alpha: 0.4)
        view.corner(16)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var signslwBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setImage(UIImage(named: "setting_cancel"), for: UIControl.State.normal)
        view.setTitle(APPLanguageInsTool.loadLanguage("setting_signout"), for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        view.setTitleColor(UIColor.ppBlack33, for: UIControl.State.normal)
        view.isUserInteractionEnabled = false
        view.layoutImageUpTitleDown()
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.numberOfLines = 0
        return view
    }()
    
    override func buildPageUI() {
        super.buildPageUI()
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#58F8FF"), UIColor.init(white: 1, alpha: 0)], gradientStyle: GradientDirectionStyle.topToBottom)
        self.title = APPLanguageInsTool.loadLanguage("setting_nav")
        
        self.basicScrollContentView.isHidden = true
        
        self.cancelslView.jk.addTapGestureRecognizerAction(self, #selector(clickCanskwk))
        self.signaouwView.jk.addTapGestureRecognizerAction(self, #selector(cliskSiswnskw))
        
        self.view.addSubview(self.logosImagw)
        self.view.addSubview(self.logoName)
        self.view.addSubview(self.versionLabe)
        self.view.addSubview(self.whiteBgskwConw)
        self.whiteBgskwConw.addSubview(self.cancelslView)
        self.whiteBgskwConw.addSubview(self.signaouwView)
        self.cancelslView.addSubview(self.canslelBtn)
        self.signaouwView.addSubview(self.signslwBtn)
    }

    
    override func layoutPageViews() {
        super.layoutPageViews()
        self.logosImagw.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(jk_kNavFrameH + 50)
        }
        
        self.logoName.snp.makeConstraints { make in
            make.centerX.equalTo(self.logosImagw)
            make.top.equalTo(self.logosImagw.snp.bottom).offset(8)
        }
        
        self.versionLabe.snp.makeConstraints { make in
            make.centerX.equalTo(self.logosImagw)
            make.top.equalTo(self.logoName.snp.bottom).offset(8)
        }
        
        self.whiteBgskwConw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(self.versionLabe.snp.bottom).offset(16)
        }
        
        self.cancelslView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(100)
            make.verticalEdges.equalToSuperview().inset(14)
        }
        
        self.canslelBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.signaouwView.snp.makeConstraints { make in
            make.left.equalTo(self.cancelslView.snp.right).offset(10)
            make.size.centerY.equalTo(self.cancelslView)
            make.right.equalToSuperview().offset(-10)
        }
        
        self.signslwBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

@objc private extension SeskwkTingtingswkViewController {
    func clickCanskwk() {
        
    }
    
    func cliskSiswnskw() {
        let siPopiew: SetisnLogouswPopView = SetisnLogouswPopView(frame: CGRectZero)
        UIDevice.current.keyWindow().addSubview(siPopiew)
        siPopiew.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        siPopiew.showPresent()
    }
}
