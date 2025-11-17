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
        self.addSubview(self.productImsgwView)
        self.addSubview(self.textLasjwiLab)
        self.addSubview(self.srviewBrrns)
        
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
}
