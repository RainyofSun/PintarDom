//
//  CalaulateRateVkskwItemView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/25.
//

import UIKit

class CalaulateRateVkskwItemView: UIView {
    
    open var isYear: Bool = true
    
    private(set) lazy var titlesljdlab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private lazy var bgViewsk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#EBF9FF")
        view.corner(10)
        return view
    }()
    
    private(set) lazy var tesjwtextFiedwView: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.borderStyle = .none
        view.textColor = UIColor.ppBlack33
        view.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        return view
    }()
    
    private lazy var btnBgView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#59E0C7")
        view.corner(6)
        return view
    }()
    
    private lazy var yearButton: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("calcular_year"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        return view
    }()
    
    private lazy var monthButton: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("calcular_month"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        return view
    }()

    private lazy var topBcosnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DF5A2"), UIColor.hexStringColor(hexString: "#0DA2F5")], gradientStyle: GradientDirectionStyle.leftBottomToRightTop)
        view.corner(6)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.yearButton.addTarget(self, action: #selector(clickChooseBtn(sender: )), for: UIControl.Event.touchUpInside)
        self.monthButton.addTarget(self, action: #selector(clickChooseBtn(sender: )), for: UIControl.Event.touchUpInside)
        
        self.addSubview(self.titlesljdlab)
        self.addSubview(self.bgViewsk)
        self.bgViewsk.addSubview(self.tesjwtextFiedwView)
        self.bgViewsk.addSubview(self.btnBgView)
        self.btnBgView.addSubview(self.topBcosnView)
        self.btnBgView.addSubview(self.yearButton)
        self.btnBgView.addSubview(self.monthButton)
        
        self.titlesljdlab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        
        self.bgViewsk.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(self.titlesljdlab.snp.bottom).offset(10)
            make.height.equalTo(54)
            make.bottom.equalToSuperview()
        }
        
        self.tesjwtextFiedwView.snp.makeConstraints { make in
            make.left.verticalEdges.equalToSuperview()
            make.right.equalTo(self.btnBgView.snp.left).offset(-8)
        }
        
        self.btnBgView.snp.makeConstraints { make in
            make.verticalEdges.right.equalToSuperview()
            make.width.equalTo(67 * 2)
        }
        
        self.yearButton.snp.makeConstraints { make in
            make.left.verticalEdges.equalToSuperview()
            make.width.equalTo(67)
        }
        
        self.monthButton.snp.makeConstraints { make in
            make.top.size.equalTo(self.yearButton)
            make.right.equalToSuperview()
        }
        
        self.topBcosnView.snp.makeConstraints { make in
            make.edges.equalTo(self.yearButton)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc private extension CalaulateRateVkskwItemView {
    func clickChooseBtn(sender: UIButton) {
        isYear = sender == self.yearButton
        
        UIView.animate(withDuration: 0.3) {
            self.topBcosnView.snp.remakeConstraints { make in
                make.edges.equalTo(sender)
            }
            
            self.btnBgView.layoutIfNeeded()
        }
    }
}
