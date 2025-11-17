//
//  SowkHomeskViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class SowkHomeskViewController: EsensiilsadwsiwViewController {

    private lazy var topView: HomBigsTospCaPProskwView = HomBigsTospCaPProskwView(frame: CGRectZero)
    private lazy var appslwkView: HomApslwlkControwlView = HomApslwlkControwlView(frame: CGRectZero)
    private lazy var bigSkwi: HomBigskwCakswiView = HomBigskwCakswiView(frame: CGRectZero)
    
    override func buildPageUI() {
        super.buildPageUI()
        self.bgImgView.image = UIImage(named: "home_bg")
        
        self.topView.setPPimage("", ppname: "SSAS")
        
        self.appslwkView.addTarget(self, action: #selector(clickAppslwjsViewsButon(sender: )), for: UIControl.Event.touchUpInside)
        
        self.basicScrollContentView.addSubview(self.topView)
        self.basicScrollContentView.addSubview(self.appslwkView)
        self.basicScrollContentView.addSubview(self.bigSkwi)
    }

    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.topView.snp.makeConstraints { make in
            make.left.width.equalToSuperview()
            make.top.equalToSuperview().offset(jk_kNavFrameH)
        }
        
        self.appslwkView.snp.makeConstraints { make in
            make.left.width.equalToSuperview()
            make.top.equalTo(self.topView.snp.bottom)
        }
        
        self.bigSkwi.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(self.view)
        }
    }
}

@objc private extension SowkHomeskViewController {
    func clickAppslwjsViewsButon(sender: HomApslwlkControwlView) {
        
    }
}
