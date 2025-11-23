//
//  AuthskwkCeolllslwCell.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class AuthskwkCeolllslwCell: UICollectionViewCell {

    private lazy var gradsViwms: GradientColorView = {
        let view = GradientColorView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 75, height: 24)))
        return view
    }()
    
    private lazy var stipLabs: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Arial_BoldMT))
    private lazy var siwmsgBawlView: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var swkNamskw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Arial_BoldMT))
    private lazy var authsBnw: APPActivityButton = APPActivityButton.buildLoadingAnimationButton(title: "")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.4)
        self.corner(12)
        self.layer.borderColor = UIColor.hexStringColor(hexString: "#B9E5FF").cgColor
        self.layer.borderWidth = 1.5
        
        self.authsBnw.titleLabel?.font = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Arial_BoldMT)
        self.authsBnw.layer.borderColor = UIColor.white.cgColor
        self.authsBnw.layer.borderWidth = 1
        self.authsBnw.corner(12)
        self.authsBnw.isUserInteractionEnabled = false
        
        self.contentView.addSubview(self.gradsViwms)
        self.gradsViwms.addSubview(self.stipLabs)
        self.contentView.addSubview(self.siwmsgBawlView)
        self.contentView.addSubview(self.swkNamskw)
        self.contentView.addSubview(self.authsBnw)
        
        self.gradsViwms.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(24)
        }

        self.stipLabs.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.verticalEdges.equalToSuperview()
        }
        
        self.siwmsgBawlView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(28)
            make.size.equalTo(35)
        }
        
        self.swkNamskw.snp.makeConstraints { make in
            make.top.equalTo(self.siwmsgBawlView.snp.bottom).offset(2)
            make.horizontalEdges.equalToSuperview().inset(13)
        }
        
        self.authsBnw.snp.makeConstraints { make in
            make.top.equalTo(self.swkNamskw.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradsViwms.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#1AFF91"), UIColor.hexStringColor(hexString: "#E0FFCD")], gradientStyle: GradientDirectionStyle.leftToRight)
        self.gradsViwms.jk.addCorner(conrners: UIRectCorner.bottomRight, radius: 12)
    }
    
    func reloadOClslwj(model: Protector) {
        if let _idsw = model.index {
            self.stipLabs.text = String(format: APPLanguageInsTool.loadLanguage("details_step"), (_idsw.item + 1))
            self.stipLabs.layoutIfNeeded()
            self.gradsViwms.layoutIfNeeded()

            // 重新设置 grads 的宽度，基于 label 的内容宽度
            let textWidth = self.stipLabs.intrinsicContentSize.width + 24
            self.gradsViwms.snp.remakeConstraints { make in
                make.left.top.equalToSuperview()
                make.height.equalTo(24)
                make.width.equalTo(max(75, textWidth))
            }
        }
        
        if let _uwe = model.lawful, let _uwwww = URL(string: _uwe) {
            self.siwmsgBawlView.setImageWith(_uwwww, options: YYWebImageOptions.setImageWithFadeAnimation)
        }
        
        self.swkNamskw.text = model.teach
        
        self.authsBnw.setTitle(model.persevere, for: UIControl.State.normal)
        if model.recall == "1" {
            self.authsBnw.setGradientColors([UIColor.hexStringColor(hexString: "#CCCCCC"), UIColor.hexStringColor(hexString: "#CCCCCC")], style: GradientDirectionStyle.leftToRight)
        } else {
            self.authsBnw.setGradientColors([UIColor.hexStringColor(hexString: "#0DF5A2"), UIColor.hexStringColor(hexString: "#0DA2F5")], style: GradientDirectionStyle.leftBottomToRightTop)
        }
    }
}
