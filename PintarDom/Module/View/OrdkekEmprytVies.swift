//
//  OrdkekEmprytVies.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class OrdkekEmprytVies: UIView {

    open var clickCoswaswClosure: (() -> Void)?
    
    private lazy var emptysiwView: UIImageView = UIImageView(image: UIImage(named: "empty_img"))
    private lazy var titlessLab: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("order_empty"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Regular))
    private lazy var sppalwBtn: APPActivityButton = APPActivityButton.buildLoadingAnimationButton(title: APPLanguageInsTool.loadLanguage("order_empty_btn"), titleColor: UIColor.white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.sppalwBtn.titleLabel?.font = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_SemiBold)
        // 按钮 padding
        self.sppalwBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        // 保证按钮不被压缩
        self.sppalwBtn.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.sppalwBtn.setContentHuggingPriority(.required, for: .horizontal)
        self.sppalwBtn.corner(21)
        self.sppalwBtn.addTarget(self, action: #selector(sliwksSlqosSender(sender: )), for: UIControl.Event.touchUpInside)
        self.addSubview(self.emptysiwView)
        self.addSubview(self.titlessLab)
        self.addSubview(self.sppalwBtn)
        
        self.titlessLab.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        self.emptysiwView.snp.makeConstraints { make in
            make.centerX.equalTo(self.titlessLab)
            make.bottom.equalTo(self.titlessLab.snp.top)
        }
        
        self.sppalwBtn.snp.makeConstraints { make in
            make.centerX.equalTo(self.titlessLab)
            make.top.equalTo(self.titlessLab.snp.bottom).offset(15)
            make.height.equalTo(42)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sliwksSlqosSender(sender: APPActivityButton) {
        self.clickCoswaswClosure?()
    }
}
