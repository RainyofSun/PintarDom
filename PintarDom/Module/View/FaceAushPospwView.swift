//
//  FaceAushPospwView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit

class FaceAushPospwView: EsensiwlwsBadisnPresentView {

    private lazy var cardskwkImswb: UIImageView = UIImageView(image: UIImage(named: "auth_card"))
    private lazy var tiplasw: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_tip"), t_color: UIColor.hexStringColor(hexString: "#E84900"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var leftBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setImage(UIImage(named: "auth_face_pop_left"), for: UIControl.State.normal)
        view.setTitle(APPLanguageInsTool.loadLanguage("auth_card_pop_left"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.ppBlack33, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        view.layoutImageUpTitleDown()
        return view
    }()
    
    private lazy var midBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setImage(UIImage(named: "auth_face_pop_mid"), for: UIControl.State.normal)
        view.setTitle(APPLanguageInsTool.loadLanguage("auth_card_pop_mid"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.ppBlack33, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        view.layoutImageUpTitleDown()
        return view
    }()
    
    private lazy var rightBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setImage(UIImage(named: "auth_face_pop_right"), for: UIControl.State.normal)
        view.setTitle(APPLanguageInsTool.loadLanguage("auth_card_pop_right"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.ppBlack33, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        view.layoutImageUpTitleDown(spacing: 12)
        return view
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("auth_card_pop_title")
        self.titleLab.font = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Arial_BoldMT)
        
        self.contentView.addSubview(self.cardskwkImswb)
        self.contentView.addSubview(self.tiplasw)
        self.contentView.addSubview(self.leftBtn)
        self.contentView.addSubview(self.midBtn)
        self.contentView.addSubview(self.rightBtn)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.cardskwkImswb.snp.makeConstraints { make in
            make.centerX.equalTo(self.titleLab)
            make.top.equalTo(self.titleLab.snp.bottom).offset(25)
        }
        
        self.tiplasw.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.cardskwkImswb.snp.bottom).offset(14)
        }
        
        self.midBtn.snp.makeConstraints { make in
            make.centerX.equalTo(self.cardskwkImswb)
            make.top.equalTo(self.tiplasw.snp.bottom).offset(13)
            make.size.equalTo(CGSize(width: 85, height: 55))
        }
        
        self.leftBtn.snp.makeConstraints { make in
            make.right.equalTo(self.midBtn.snp.left).offset(-15)
            make.size.centerY.equalTo(self.midBtn)
        }
        
        self.rightBtn.snp.makeConstraints { make in
            make.left.equalTo(self.midBtn.snp.right).offset(15)
            make.size.centerY.equalTo(self.midBtn)
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(self.cardskwkImswb)
            make.top.equalTo(self.midBtn.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-27)
        }
    }
}
