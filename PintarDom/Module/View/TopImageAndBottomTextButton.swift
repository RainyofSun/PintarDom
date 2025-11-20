//
//  TopImageAndBottomTextButton.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/18.
//

import UIKit

class TopImageAndBottomTextButton: UIControl {

    private lazy var topImgView: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var textLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppGray8C, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isHidden = true
        
        self.addSubview(self.topImgView)
        self.addSubview(self.textLab)
        
        self.topImgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(50)
        }
        
        self.textLab.snp.makeConstraints { make in
            make.top.equalTo(self.topImgView.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview().inset(2)
            make.bottom.equalToSuperview().offset(-3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setImage(_ image: String, title: String) {
        self.topImgView.image = UIImage(named: image)
        self.textLab.text = title
    }
    
}
