//
//  CardLoaskwAuthView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class CardLoaskwAuthView: UIControl {

    private lazy var tipSowkView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#70FFE5")
        view.isUserInteractionEnabled = false
        view.corner(16)
        return view
    }()
    
    private(set) lazy var tipLasbw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium))

    private lazy var nshwView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#EBF8FF")
        view.isUserInteractionEnabled = false
        view.corner(16)
        return view
    }()
    
    private(set) lazy var temslwImgView: UIImageView = UIImageView(frame: CGRectZero)
    
    private(set) lazy var updalwTpwImg: UIImageView = UIImageView(image: UIImage(named: "auth_bar"))
    private(set) lazy var uspwTipwslLab: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_upload"), t_color: UIColor.white, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Arial_BoldMT))
    
    init(frame: CGRect, isFace: Bool) {
        super.init(frame: frame)
        
        self.tipLasbw.textAlignment = .left
        self.temslwImgView.image = isFace ? UIImage(named: "auth_face_begin") : UIImage(named: "auth_card")
        self.temslwImgView.contentMode = .scaleAspectFill
        
        self.addSubview(self.tipSowkView)
        self.tipSowkView.addSubview(self.tipLasbw)
        self.addSubview(self.nshwView)
        self.nshwView.addSubview(self.temslwImgView)
        self.addSubview(self.updalwTpwImg)
        self.updalwTpwImg.addSubview(self.uspwTipwslLab)
        
        self.tipSowkView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.top.equalToSuperview()
        }
        
        self.tipLasbw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.verticalEdges.equalToSuperview().inset(15)
        }
        
        self.nshwView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.tipSowkView)
            make.top.equalTo(self.tipSowkView.snp.bottom).offset(10)
            make.height.equalTo(140)
        }
        
        self.temslwImgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 190, height: 100))
        }
        
        self.updalwTpwImg.snp.makeConstraints { make in
            make.centerX.equalTo(self.nshwView)
            make.top.equalTo(self.nshwView.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
        
        self.uspwTipwslLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
