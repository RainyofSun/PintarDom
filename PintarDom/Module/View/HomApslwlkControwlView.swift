//
//  HomApslwlkControwlView.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/18.
//

import UIKit

class HomApslwlkControwlView: UIControl {
    
    private lazy var topTip: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppGray8C, t_f: UIFont.systemFont(ofSize: 14))
    private lazy var amountLas: UILabel = UILabel.normalTextLabel("", t_color: UIColor.pp22115168, t_f: UIFont.loadSpecialFont(size: 40, ftStyle: FontStyle.Inter_ExtraBold))
    private lazy var rasteView: RastwAnsRasyDaysView = RastwAnsRasyDaysView(frame: CGRectZero)
    private lazy var safeView: TopImageAndBottomTextButton = TopImageAndBottomTextButton(frame: CGRectZero)
    private lazy var fastView: TopImageAndBottomTextButton = TopImageAndBottomTextButton(frame: CGRectZero)
    private lazy var simpleView: TopImageAndBottomTextButton = TopImageAndBottomTextButton(frame: CGRectZero)
    private(set) lazy var appBtn: APPActivityButton = APPActivityButton.buildLoadingAnimationButton(title: "")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.appBtn.isUserInteractionEnabled = false
        self.appBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.appBtn.titleLabel?.font = UIFont.loadSpecialFont(size: 20, ftStyle: FontStyle.Inter_ExtraBold)
        self.appBtn.corner(25)
        
        self.topTip.text = "s1231283923"
        self.amountLas.text = "129391283"
        self.rasteView.setLoasTip("akskwa", value: "1212", isDay: true)
        self.rasteView.setLoasTip("akskwa", value: "1212", isDay: false)
        
        self.safeView.setImage("home_safe", title: APPLanguageInsTool.loadLanguage("home_safe"))
        self.fastView.setImage("home_fast", title: APPLanguageInsTool.loadLanguage("home_fast"))
        self.simpleView.setImage("home_rate", title: APPLanguageInsTool.loadLanguage("home_simple"))
        
        self.addSubview(self.topTip)
        self.addSubview(self.amountLas)
        self.addSubview(self.rasteView)
        self.addSubview(self.safeView)
        self.addSubview(self.fastView)
        self.addSubview(self.simpleView)
        self.addSubview(self.appBtn)
        
        self.topTip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        self.amountLas.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.topTip.snp.bottom).offset(5)
        }
        
        self.rasteView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(self.amountLas.snp.bottom).offset(10)
        }
        
        self.fastView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.rasteView.snp.bottom).offset(14)
        }
        
        self.safeView.snp.makeConstraints { make in
            make.left.equalTo(self.rasteView).offset(8)
            make.top.equalTo(self.fastView)
        }
        
        self.simpleView.snp.makeConstraints { make in
            make.right.equalTo(self.rasteView).offset(-8)
            make.top.equalTo(self.fastView)
        }
        
        self.appBtn.snp.makeConstraints { make in
            make.top.equalTo(self.fastView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.rasteView)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
