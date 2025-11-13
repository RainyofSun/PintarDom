//
//  WinsLanscusherViewController.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/13.
//

import UIKit

class WinsLanscusherViewController: EsensiilsadwsiwViewController {

    private lazy var bgImgView = UIImageView(image: UIImage(named: "launcher"))
    private lazy var tryswjBtn = APPActivityButton.buildLoadingAnimationButton(title: APPLanguageInsTool.loadLanguage("lunch_try"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tryswjBtn.corner(25)
        self.tryswjBtn.layer.borderWidth = 1
        self.tryswjBtn.layer.borderColor = UIColor.white.cgColor
        self.tryswjBtn.addTarget(self, action: #selector(cliskwtrysuBuwson(sender: )), for: UIControl.Event.touchUpInside)
        
        self.bgImgView.isUserInteractionEnabled = true
        self.view.addSubview(self.bgImgView)
        self.bgImgView.addSubview(self.tryswjBtn)
        
        self.bgImgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tryswjBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    
    
    @objc func cliskwtrysuBuwson(sender: APPActivityButton) {
        
    }
}
