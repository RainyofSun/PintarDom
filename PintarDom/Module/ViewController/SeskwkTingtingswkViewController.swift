//
//  SeskwkTingtingswkViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit

class SeskwkTingtingswkViewController: EsensiilsadwsiwViewController {

    private lazy var logosImagw: UIImageView = UIImageView(image: UIImage(named: "home_logo"))
    private lazy var versionLabe: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("setting_version"), t_color: UIColor.hexStringColor(hexString: "#8E8E93"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var logoName: UILabel = UILabel.normalTextLabel(Bundle.jk.appDisplayName, t_color: UIColor.hexStringColor(hexString: "#0993D5"), t_f: UIFont.loadSpecialFont(size: 20, ftStyle: FontStyle.Inter_ExtraBold))
    
    override func buildPageUI() {
        super.buildPageUI()
        self.gradientView.isHidden = false
        self.gradientView.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#58F8FF"), UIColor.init(white: 1, alpha: 0)], gradientStyle: GradientDirectionStyle.topToBottom)
        self.title = APPLanguageInsTool.loadLanguage("setting_nav")
        
        
    }

}
