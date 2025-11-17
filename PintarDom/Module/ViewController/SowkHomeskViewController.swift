//
//  SowkHomeskViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class SowkHomeskViewController: EsensiilsadwsiwViewController {

    private lazy var bigSkwi: HomBigskwCakswiView = HomBigskwCakswiView(frame: CGRectZero)
    
    override func buildPageUI() {
        super.buildPageUI()
        self.bgImgView.image = UIImage(named: "home_bg")
        
        self.basicScrollContentView.addSubview(self.bigSkwi)
    }

    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.bigSkwi.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(self.view)
        }
    }
}
