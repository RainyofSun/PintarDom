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
        btn.setGradientColors([UIColor.ppGreen.withAlphaComponent(0.8), UIColor.ppBlue.withAlphaComponent(0.8)], style: GradientDirectionStyle.leftBottomToRightTop)
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitleColor(titleColor, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Inter_Medium)
        return btn
    }
    
    static func buildLoadingAnimationNoColorButton(title: String, titleColor: UIColor = .white) -> APPActivityButton {
        let btn: APPActivityButton = APPActivityButton(type: UIButton.ButtonType.custom)
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitleColor(titleColor, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.loadSpecialFont(size: 18, ftStyle: FontStyle.Inter_Medium)
        return btn
    }
    
    func layoutImageUpTitleDown(spacing: CGFloat = 4) {
        guard let imageSize = self.imageView?.image?.size,
              let title = self.titleLabel?.text,
              let font = self.titleLabel?.font else { return }

        let titleSize = (title as NSString).size(withAttributes: [.font: font])
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: spacing,
            left: -imageSize.width,
            bottom: -imageSize.height,
            right: 0
        )

        self.imageEdgeInsets = UIEdgeInsets(
            top: -titleSize.height - spacing,
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )

        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
    }
}
