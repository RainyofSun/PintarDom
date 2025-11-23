//
//  AuthExtensiwksViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class AuthExtensiwksViewController: EsensiilsadwsiwViewController {

    private(set) lazy var bottomView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        return view
    }()
    
    private(set) lazy var nextBtn: APPActivityButton = {
        let btn: APPActivityButton = APPActivityButton(type: UIButton.ButtonType.custom)
        btn.setGradientColors([UIColor.hexStringColor(hexString: "#0DF5A2").withAlphaComponent(0.8), UIColor.hexStringColor(hexString: "#0DA2F5").withAlphaComponent(0.8)], style: GradientDirectionStyle.leftBottomToRightTop)
        btn.setTitle(APPLanguageInsTool.loadLanguage("auth_next"), for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium)
        
        return btn
    }()
    
    private lazy var topBcosnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DA2F5"), UIColor.hexStringColor(hexString: "#0DF5A2", alpha: 0)], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
        view.corner(16)
        view.frame = CGRect(origin: CGPointZero, size: CGSizeMake(jk_kScreenW - 32, 90))
        view.jk.addCorner(conrners: [.topLeft, .topRight], radius: 16)
        return view
    }()
    
    private lazy var badgeView: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.frame = CGRect(origin: CGPointZero, size: CGSize(width: 80, height: 27))
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FF8801")
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Arial_BoldMT)
        return view
    }()
    
    private lazy var topTilsLab: UILabel = {
        let view = UILabel(frame: CGRectZero)
        view.numberOfLines = 0
        return view
    }()
    
    private(set) var _next_tilskw_map: [ChanPinAuthElement: [String: String]]?
    private(set) var _type: ChanPinAuthElement = ChanPinAuthElement.Certif_ID_Cosujward
    private(set) var _next_type: ChanPinAuthElement = ChanPinAuthElement.Certif_ID_Cosujward
    
    init(cerasauAutheTiel title: String?, nexjsAujwTheielw next: [ChanPinAuthElement : [String: String]]? = nil, authStyle style: (current: ChanPinAuthElement, next: ChanPinAuthElement)) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self._next_tilskw_map = next
        self._type = style.current
        self._next_type = style.next
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        self.nextBtn.corner(23)
        self.nextBtn.addTarget(self, action: #selector(clickNextButtons(sender: )), for: UIControl.Event.touchUpInside)
    
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#21F0E8"), UIColor.hexStringColor(hexString: "#3BF8FF", alpha: 0.63)], gradientStyle: GradientDirectionStyle.topToBottom)
        
        if let _des = self._next_tilskw_map?[self._type]?["des"] {
            let sewAyyas: [String] = _des.components(separatedBy: "+")
            let paysaq: NSMutableParagraphStyle = NSMutableParagraphStyle()
            paysaq.paragraphSpacing = 4
            let titleSqqwi: NSMutableAttributedString = NSMutableAttributedString(string: String(format: "%@\n", sewAyyas.first ?? ""), attributes: [.font: UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Arial_BoldMT), .foregroundColor: UIColor.white, .paragraphStyle: paysaq])
            titleSqqwi.append(NSAttributedString(string: sewAyyas.last ?? "", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), .foregroundColor: UIColor.white]))
            self.topTilsLab.attributedText = titleSqqwi
        }
        
        self.view.addSubview(self.bottomView)
        self.bottomView.addSubview(self.nextBtn)
        self.view.addSubview(self.topBcosnView)
        self.topBcosnView.addSubview(self.badgeView)
        self.topBcosnView.addSubview(self.topTilsLab)
        
        self.pageNetRequest()
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.topBcosnView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(90)
            make.top.equalToSuperview().offset(jk_kNavFrameH)
        }
        
        self.badgeView.snp.makeConstraints { make in
            make.right.top.equalToSuperview()
        }
        
        self.topTilsLab.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(20)
        }
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(self.bottomView.snp.top).offset(-8)
        }
        
        self.bottomView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.nextBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(46)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-UIDevice.current.keyWindow().safeAreaInsets.bottom - 8)
        }
    }
    
    @objc func clickNextButtons(sender: APPActivityButton) {
        
    }
}
