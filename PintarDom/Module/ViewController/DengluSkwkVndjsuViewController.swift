//
//  DengluSkwkVndjsuViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit

class DengluSkwkVndjsuViewController: EsensiilsadwsiwViewController, AutoHiddenNavigationBar {

    private lazy var presendsPopsVIew: UsjekwLodskwkView = UsjekwLodskwkView(frame: CGRectZero)
    
    override func buildPageUI() {
        self.presendsPopsVIew.alpha = 1
        self.presendsPopsVIew.f_weak_conrolw = self
        self.view.addSubview(self.presendsPopsVIew)
    }

    override func layoutPageViews() {
        self.presendsPopsVIew.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
