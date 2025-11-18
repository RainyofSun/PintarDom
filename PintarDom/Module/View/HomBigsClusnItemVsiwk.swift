//
//  HomBigsClusnItemVsiwk.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/18.
//

import UIKit

class HomBigsClusnItemVsiwk: UIControl {

    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4"), UIColor.hexStringColor(hexString: "#3FE2FF")], gradientStyle: GradientDirectionStyle.leftToRight)
        return vew
    }()
    
    private lazy var leftImgView: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var ttleskkLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 15, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var righwwdImsw: UIImageView = UIImageView(image: UIImage(named: "home_back_1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.corner(16)
    
        self.addSubview(self.gradiensView)
        self.addSubview(self.leftImgView)
        self.addSubview(self.ttleskkLab)
        self.addSubview(self.righwwdImsw)
        
        self.gradiensView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.leftImgView.snp.makeConstraints { make in
            make.size.equalTo(47)
            make.left.equalToSuperview().offset(18)
            make.verticalEdges.equalToSuperview().inset(14)
        }
        
        self.ttleskkLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.leftImgView)
            make.left.equalTo(self.leftImgView.snp.right).offset(10)
        }
        
        self.righwwdImsw.snp.makeConstraints { make in
            make.centerY.equalTo(self.leftImgView)
            make.right.equalToSuperview().offset(-18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLeftskkwiMsgw(_ imasgwaNamw: String, titleSkwks: String) {
        self.leftImgView.image = UIImage(named: imasgwaNamw)
        self.ttleskkLab.text = titleSkwks
    }
    
}
