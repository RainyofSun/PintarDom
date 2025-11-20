//
//  MineItemCelswkViews.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/19.
//

import UIKit

class MineItemCelswkViews: UIControl {

    open var jumpUrl: String?
    private(set) lazy var leftimsgeView: UIImageView = UIImageView(frame: CGRectZero)
    private(set) lazy var titleLabsw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var arowskimgView: UIImageView = UIImageView(image: UIImage(named: "mine_arrow"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.corner(20)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.62)
        
        self.addSubview(self.leftimsgeView)
        self.addSubview(self.titleLabsw)
        self.addSubview(self.arowskimgView)
        
        self.leftimsgeView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.verticalEdges.equalToSuperview().inset(12)
            make.size.equalTo(30)
        }
        
        self.titleLabsw.snp.makeConstraints { make in
            make.centerY.equalTo(self.leftimsgeView)
            make.left.equalTo(self.leftimsgeView.snp.right).offset(10)
        }
        
        self.arowskimgView.snp.makeConstraints { make in
            make.centerY.equalTo(self.leftimsgeView)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
