//
//  HosmwTBiswhTipSiwkView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/18.
//

import UIKit

class TispwskCelsliwView: UIView {
    
    private(set) lazy var skwkViwlslw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium))
    private lazy var isamwkduwImsView: UIImageView = UIImageView(image: UIImage(named: "home_back_2"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.corner(22)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.52)
        
        self.addSubview(self.skwkViwlslw)
        self.addSubview(self.isamwkduwImsView)
        
        self.skwkViwlslw.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        self.isamwkduwImsView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HosmwTBiswhTipSiwkView: UIControl {

    private lazy var titleLab: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("home_tip1"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.corner(16)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
        
        self.addSubview(self.titleLab)
        self.titleLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(14)
        }
        
        var tis_swk: TispwskCelsliwView?
        for i in 2..<7 {
            let vieswk: TispwskCelsliwView = TispwskCelsliwView(frame: CGRectZero)
            vieswk.skwkViwlslw.text = APPLanguageInsTool.loadLanguage("home_tip\(i)")
            self.addSubview(vieswk)
            
            if let _eowk = tis_swk {
                if i == 6 {
                    vieswk.snp.makeConstraints { make in
                        make.height.horizontalEdges.equalTo(_eowk)
                        make.bottom.equalToSuperview().offset(-12)
                        make.top.equalTo(_eowk.snp.bottom).offset(8)
                    }
                } else {
                    vieswk.snp.makeConstraints { make in
                        make.height.horizontalEdges.equalTo(_eowk)
                        make.top.equalTo(_eowk.snp.bottom).offset(8)
                    }
                }
            } else {
                vieswk.snp.makeConstraints { make in
                    make.horizontalEdges.equalToSuperview().inset(16)
                    make.top.equalTo(self.titleLab.snp.bottom).offset(10)
                    make.height.equalTo(44)
                }
            }
            
            tis_swk = vieswk
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.jk.addViewCornerAndShadow(conrners: UIRectCorner.allCorners, shadowColor: UIColor.init(white: 0, alpha: 0.25), shadowOffset: CGSize(width: 0, height: 4), shadowOpacity: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
