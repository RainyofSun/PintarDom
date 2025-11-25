//
//  CalaulateResultswpeStepView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/26.
//

import UIKit

class CalaulateResultswpeStepView: UIView {

    private lazy var tipLab1: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset3"), t_color: UIColor.hexStringColor(hexString: "#999999"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private(set) lazy var valueLab1: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset4"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    private lazy var tipLab2: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset4"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private(set) lazy var valueLab2: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset4"), t_color: UIColor.hexStringColor(hexString: "#0972A4"), t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    private lazy var topBcosnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DF5A2"), UIColor.hexStringColor(hexString: "#0DA2F5")], gradientStyle: GradientDirectionStyle.leftBottomToRightTop)
        view.corner(10)
        return view
    }()
    private lazy var bgView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(10)
        return view
    }()
    
    private lazy var tipLab3: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset4"), t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private(set) lazy var valueLab3: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset4"), t_color: UIColor.hexStringColor(hexString: "#0972A4"), t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    private lazy var dotView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DF5A2"), UIColor.hexStringColor(hexString: "#0DA2F5")], gradientStyle: GradientDirectionStyle.leftBottomToRightTop)
        view.corner(5)
        return view
    }()
    private lazy var dashLineView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.jk.drawDashLine(strokeColor: UIColor.hexStringColor(hexString: "#0972A4"), direction: JKDashLineDirection.vertical)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.dotView)
        self.addSubview(self.dashLineView)
        self.addSubview(self.tipLab1)
        self.addSubview(self.valueLab1)
        self.addSubview(self.tipLab2)
        self.addSubview(self.valueLab2)
        self.addSubview(self.topBcosnView)
        self.topBcosnView.addSubview(self.bgView)
        self.bgView.addSubview(self.tipLab3)
        self.bgView.addSubview(self.valueLab3)
        
        self.tipLab1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(self.dotView.snp.right).offset(10)
        }
        
        self.valueLab1.snp.makeConstraints { make in
            make.centerY.equalTo(self.tipLab1)
            make.right.equalToSuperview()
        }
        
        self.dotView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(self.tipLab1)
            make.size.equalTo(10)
        }
        
        self.dashLineView.snp.makeConstraints { make in
            make.centerX.equalTo(self.dotView)
            make.width.equalTo(1)
            make.top.equalTo(self.dotView.snp.bottom)
            make.height.greaterThanOrEqualTo(50)
            make.bottom.equalToSuperview()
        }
        
        self.tipLab2.snp.makeConstraints { make in
            make.left.equalTo(self.tipLab1)
            make.top.equalTo(self.tipLab1.snp.bottom).offset(10)
        }
        
        self.valueLab2.snp.makeConstraints { make in
            make.centerY.equalTo(self.tipLab2)
            make.right.equalTo(self.valueLab1)
        }
        
        self.topBcosnView.snp.makeConstraints { make in
            make.left.equalTo(self.tipLab2)
            make.right.equalTo(self.valueLab2)
            make.top.equalTo(self.tipLab2.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        self.bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
        }
        
        self.tipLab3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        self.valueLab3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
