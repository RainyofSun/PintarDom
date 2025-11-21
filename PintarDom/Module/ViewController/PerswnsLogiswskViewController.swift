//
//  PerswnsLogiswskViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class PerswnsLogiswskViewController: EsensiilsadwsiwViewController, AutoHiddenNavigationBar {

    private lazy var presendsPopsVIew: UsjekwLodskwkView = UsjekwLodskwkView(frame: CGRectZero)
    
    override func buildPageUI() {
        self.presendsPopsVIew.alpha = 1
        self.view.addSubview(self.presendsPopsVIew)
    }

    override func layoutPageViews() {
        self.presendsPopsVIew.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
