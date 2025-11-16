//
//  LabelEskwTensowks.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/15.
//

import UIKit

extension UILabel {
    static func normalTextLabel(_ text: String, t_color: UIColor, t_f: UIFont) -> UILabel {
        let label = UILabel(frame: CGRectZero)
        label.textColor = t_color
        label.font = t_f
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    static func gradientTextLabel(_ text: String, t_color: UIColor, t_f: UIFont, stroke: UIColor, strokeW: CGFloat, jianBianColors: [UIColor]) -> JianBianLab {
        let texLab: JianBianLab = JianBianLab.init(frame: CGRectZero)
        texLab.text = text
        texLab.font = t_f
        texLab.textColor = t_color
        texLab.strokeColor = stroke
        texLab.strokeWidth = strokeW
        texLab.gradientColors = jianBianColors
        return texLab
    }
}
