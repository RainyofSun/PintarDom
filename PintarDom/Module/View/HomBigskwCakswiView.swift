//
//  HomBigskwCakswiView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/17.
//

import UIKit

class HomBigskwCakswiView: UIView {

    private lazy var privaViews: HomBigsClusnItemVsiwk = HomBigsClusnItemVsiwk(frame: CGRectZero)
    private lazy var caslwskViews: HomBigsClusnItemVsiwk = HomBigsClusnItemVsiwk(frame: CGRectZero)
    private lazy var shwkTipskwView: HosmwTBiswhTipSiwkView = HosmwTBiswhTipSiwkView(frame: CGRectZero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.privaViews.setLeftskkwiMsgw("home_privacy", titleSkwks: APPLanguageInsTool.loadLanguage("home_p_p"))
        self.caslwskViews.setLeftskkwiMsgw("home_calcu", titleSkwks: APPLanguageInsTool.loadLanguage("home_cal"))
        self.caslwskViews.setcalskawColrosStyle()
        
        self.privaViews.addTarget(self, action: #selector(cliskwiPrsjwjUrl), for: UIControl.Event.touchUpInside)
        self.caslwskViews.addTarget(self, action: #selector(clicksCaskwkVolows), for: UIControl.Event.touchUpInside)
        self.shwkTipskwView.addTarget(self, action: #selector(clickskwRosmwCiws), for: UIControl.Event.touchUpInside)
        
        self.addSubview(self.privaViews)
        self.addSubview(self.shwkTipskwView)
        
        self.privaViews.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        }
        
        #if DEBUG
        self.addSubview(self.caslwskViews)
        self.caslwskViews.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.privaViews)
            make.top.equalTo(self.privaViews.snp.bottom).offset(12)
        }
        
        self.shwkTipskwView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.privaViews)
            make.top.equalTo(self.caslwskViews.snp.bottom).offset(14)
            make.bottom.equalToSuperview().offset(-8)
        }
        #else
        if GLoskwCommenskwmodls.shared.countryCode == 1 {
            self.addSubview(self.caslwskViews)
            self.caslwskViews.snp.makeConstraints { make in
                make.horizontalEdges.equalTo(self.privaViews)
                make.top.equalTo(self.privaViews.snp.bottom).offset(12)
            }
            
            self.shwkTipskwView.snp.makeConstraints { make in
                make.horizontalEdges.equalTo(self.privaViews)
                make.top.equalTo(self.caslwskViews.snp.bottom).offset(14)
                make.bottom.equalToSuperview().offset(-8)
            }
        } else {
            self.shwkTipskwView.snp.makeConstraints { make in
                make.horizontalEdges.equalTo(self.privaViews)
                make.top.equalTo(self.privaViews.snp.bottom).offset(14)
                make.bottom.equalToSuperview().offset(-8)
            }
        }
        #endif
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc private extension HomBigskwCakswiView {
    func cliskwiPrsjwjUrl() {
        if let _url = GLoskwCommenskwmodls.shared.privacyURL {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _url, needBackRoot: true)
        }
    }
    
    func clickskwRosmwCiws() {
        LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: "", targetViewController: ComskwkProslwViewController())
    }
    
    func clicksCaskwkVolows() {
        LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: "", targetViewController: ComskwkProslwViewController())
    }
}
