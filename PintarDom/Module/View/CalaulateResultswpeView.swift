//
//  CalaulateResultswpeView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/25.
//

import UIKit

class CalaulateResultswpeView: UIView {

    private(set) lazy var titlesljdlab: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset1"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private lazy var topBcosnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DF5A2"), UIColor.hexStringColor(hexString: "#0DA2F5")], gradientStyle: GradientDirectionStyle.leftBottomToRightTop)
        view.corner(12)
        return view
    }()

    private lazy var tipLab1: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_tip3_place2"), t_color: UIColor.init(white: 1, alpha: 0.6), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var amountLab1: UILabel = UILabel.normalTextLabel("", t_color: UIColor.white, t_f: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium))
    private lazy var addLab: UILabel = UILabel.normalTextLabel("+", t_color: UIColor.white, t_f: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium))
    private lazy var tipLab2: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_tip3_place1"), t_color: UIColor.init(white: 1, alpha: 0.6), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var amountLab2: UILabel = UILabel.normalTextLabel("", t_color: UIColor.white, t_f: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium))
    private lazy var equalLab: UILabel = UILabel.normalTextLabel("=", t_color: UIColor.white, t_f: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium))
    private lazy var tipLab3: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_tip3_place3"), t_color: UIColor.init(white: 1, alpha: 0.6), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var amountLab3: UILabel = UILabel.normalTextLabel("", t_color: UIColor.white, t_f: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium))
    private lazy var amountLab4: UILabel = {
        let view = UILabel.normalTextLabel("", t_color: UIColor.white, t_f: UIFont.loadSpecialFont(size: 32, ftStyle: FontStyle.Inter_ExtraBold))
        view.backgroundColor = UIColor.hexStringColor(hexString: "#0972A4")
        view.corner(16)
        return view
    }()
    
    private(set) lazy var titlesljdlab1: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("calcular_reset2"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titlesljdlab)
        self.addSubview(self.topBcosnView)
        self.topBcosnView.addSubview(self.tipLab1)
        self.topBcosnView.addSubview(self.amountLab1)
        self.topBcosnView.addSubview(self.addLab)
        self.topBcosnView.addSubview(self.tipLab2)
        self.topBcosnView.addSubview(self.amountLab2)
        self.topBcosnView.addSubview(self.equalLab)
        self.topBcosnView.addSubview(self.tipLab3)
        self.topBcosnView.addSubview(self.amountLab3)
        self.topBcosnView.addSubview(self.amountLab4)
        self.addSubview(self.titlesljdlab1)
        
        self.titlesljdlab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview()
        }
        
        self.topBcosnView.snp.makeConstraints { make in
            make.left.equalTo(self.titlesljdlab)
            make.top.equalTo(self.titlesljdlab.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(12)
        }
        
        self.tipLab1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(16)
        }
        
        self.amountLab1.snp.makeConstraints { make in
            make.centerX.equalTo(self.tipLab1)
            make.top.equalTo(self.tipLab1.snp.bottom).offset(6)
            make.bottom.equalToSuperview().offset(-14)
        }
        
        self.addLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.tipLab1)
            make.left.equalTo(self.tipLab1.snp.right).offset(20)
        }
        
        self.tipLab2.snp.makeConstraints { make in
            make.top.width.equalTo(self.tipLab1)
            make.left.equalTo(self.addLab.snp.right).offset(20)
        }
        
        self.amountLab2.snp.makeConstraints { make in
            make.centerY.equalTo(self.amountLab1)
            make.centerX.equalTo(self.tipLab2)
        }
        
        self.equalLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.addLab)
            make.left.equalTo(self.tipLab2.snp.right).offset(20)
        }
        
        self.tipLab3.snp.makeConstraints { make in
            make.top.width.equalTo(self.tipLab2)
            make.left.equalTo(self.equalLab.snp.right).offset(20)
            make.right.equalToSuperview().offset(-12)
        }
        
        self.amountLab3.snp.makeConstraints { make in
            make.centerY.equalTo(self.amountLab2)
            make.centerX.equalTo(self.tipLab3)
        }
        
        self.amountLab4.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.topBcosnView)
            make.top.equalTo(self.topBcosnView.snp.bottom)
            make.height.equalTo(60)
        }
        
        self.titlesljdlab1.snp.makeConstraints { make in
            make.left.equalTo(self.titlesljdlab)
            make.top.equalTo(self.amountLab4.snp.bottom).offset(12)
//            make.bottom.equalToSuperview()
        }
        
        self.buildSteopView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

private extension CalaulateResultswpeView {
    func buildSteopView() {
        var topCkwk: CalaulateResultswpeStepView?
        
        for item in 0..<3 {
            let view = CalaulateResultswpeStepView(frame: CGRectZero)
            self.addSubview(view)
            
            if let _tt = topCkwk {
                if item == 2 {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tt.snp.bottom)
                        make.top.equalTo(_tt.snp.bottom)
                        make.bottom.equalToSuperview().offset(-12)
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tt.snp.bottom)
                        make.top.equalTo(_tt.snp.bottom)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.top.equalTo(self.titlesljdlab1.snp.bottom).offset(10)
                    make.horizontalEdges.equalToSuperview()
                }
            }
            
            topCkwk = view
        }
    }
}
