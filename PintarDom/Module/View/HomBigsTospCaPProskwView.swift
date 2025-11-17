//
//  HomBigsTospCaPProskwView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/17.
//

import UIKit

class HomBigsTospCaPProskwView: UIView {

    private lazy var productImsgwView: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var textLasjwiLab: UILabel = {
        let view = UILabel(frame: CGRectZero)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var srviewBrrns: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setImage(UIImage(named: "service"), for: UIControl.State.normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.productImsgwView.corner(28)
        self.addSubview(self.productImsgwView)
        self.addSubview(self.textLasjwiLab)
        self.addSubview(self.srviewBrrns)
        
        self.productImsgwView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(22)
            make.top.equalToSuperview().offset(14)
            make.size.equalTo(56)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        self.textLasjwiLab.snp.makeConstraints { make in
            make.top.equalTo(self.productImsgwView).offset(5)
            make.left.equalTo(self.productImsgwView.snp.right).offset(12)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        self.srviewBrrns.snp.makeConstraints { make in
            make.centerY.equalTo(self.productImsgwView)
            make.right.equalToSuperview().offset(32)
        }
        
        self.srviewBrrns.addTarget(self, action: #selector(clickSewisbtns(sender: )), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func clickSewisbtns(sender: UIButton) {
        if let _uurl = GLoskwCommenskwmodls.shared.privacyURL {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _uurl, needBackRoot: true)
        }
    }
    
    func setPPimage(_ imswUrl: String, ppname: String) {
        if let _iwls = URL(string: imswUrl) {
            self.productImsgwView.setImageWith(_iwls, options: [YYWebImageOptions.setImageWithFadeAnimation])
        }
        
        let parasStywl: NSMutableParagraphStyle = NSMutableParagraphStyle()
        parasStywl.paragraphSpacing = 4
        let ppNamswiStr: NSMutableAttributedString = NSMutableAttributedString(string: "\(ppname)\n", attributes: [.font: UIFont.loadSpecialFont(size: 20, ftStyle: FontStyle.Inter_SemiBold), .foregroundColor: UIColor.ppBlue3D5, .paragraphStyle: parasStywl])
        ppNamswiStr.append(NSAttributedString(string: String(format: APPLanguageInsTool.loadLanguage("home_tip"), ppname), attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.ppGray8C]))
        self.textLasjwiLab.attributedText = ppNamswiStr
    }
}
