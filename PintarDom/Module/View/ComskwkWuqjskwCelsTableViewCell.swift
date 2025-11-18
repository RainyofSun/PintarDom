//
//  ComskwkWuqjskwCelsTableViewCell.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/18.
//

import UIKit

class ComskwkWuqjskwCelsTableViewCell: UITableViewCell {

    private lazy var gradisntnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DA2F5"), UIColor.hexStringColor(hexString: "#0DF5A2", alpha: 0.5)], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
        view.corner(16)
        return view
    }()
    
    private(set) lazy var titleLa: UILabel = UILabel.normalTextLabel("", t_color: UIColor.white, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private lazy var arowsImgView: UIImageView = UIImageView(image: UIImage(named: "setting_up"))
    private lazy var whitebgViews: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(16)
        return view
    }()
    
    private(set) lazy var cosnrwmsLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#262626"), t_f: UIFont.systemFont(ofSize: 14))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.titleLa.textAlignment = .left
        self.cosnrwmsLab.textAlignment = .left
        
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.whitebgViews)
        self.contentView.addSubview(self.gradisntnView)
        self.gradisntnView.addSubview(self.titleLa)
        self.gradisntnView.addSubview(self.arowsImgView)
        self.whitebgViews.addSubview(self.cosnrwmsLab)
        
        self.gradisntnView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        }
        
        self.titleLa.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.verticalEdges.equalToSuperview().inset(10)
            make.right.lessThanOrEqualTo(self.arowsImgView.snp.left).offset(-16)
        }
        
        self.arowsImgView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }
        
        self.whitebgViews.snp.makeConstraints { make in
            make.top.equalTo(self.gradisntnView.snp.bottom).offset(-25)
            make.horizontalEdges.equalTo(self.gradisntnView)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        self.cosnrwmsLab.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(14)
            make.top.equalTo(self.gradisntnView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
