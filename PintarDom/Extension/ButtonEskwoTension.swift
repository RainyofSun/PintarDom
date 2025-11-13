//
//  ButtonEskwoTension.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

extension UIButton {
    static func buildLoadingAnimationButton(title: String, titleColor: UIColor = .white) -> APPActivityButton {
        let btn: APPActivityButton = APPActivityButton(type: UIButton.ButtonType.custom)
        btn.setGradientColors([UIColor.ppGreen, UIColor.ppBlue], style: GradientDirectionStyle.leftBottomToRightTop)
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitleColor(titleColor, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Inter_Medium)
        return btn
    }
}
