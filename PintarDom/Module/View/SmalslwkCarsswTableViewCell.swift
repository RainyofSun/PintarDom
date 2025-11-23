//
//  SmalslwkCarsswTableViewCell.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/21.
//

import UIKit

class SmalslwkCarsswTableViewCell: UITableViewCell {

    private lazy var topBcosnView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#70FFE5", alpha: 0.6)
        view.corner(16)
        return view
    }()
    
    private lazy var logiskwImfbsView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.corner(4)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var namswkPalsw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_Medium))
    
    private(set) lazy var checksBtn: APPActivityButton = APPActivityButton.buildLoadingAnimationButton(title: "")
    private lazy var swhsiwkViews: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#F0FCFF", alpha: 0.84)
        view.corner(16)
        return view
    }()
    
    private lazy var limtiwskLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#999999"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var rateiwskLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#999999"), t_f: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var limtiwsValuekLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    private lazy var ratewsValuekLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.checksBtn.corner(16)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        self.checksBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        // 按钮 padding
        self.checksBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

        // 保证按钮不被压缩
        self.checksBtn.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.checksBtn.setContentHuggingPriority(.required, for: .horizontal)

        // 让左侧文字优先被压缩
        self.namswkPalsw.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.checksBtn.isUserInteractionEnabled = false
        
        self.contentView.addSubview(self.topBcosnView)
        self.topBcosnView.addSubview(self.logiskwImfbsView)
        self.topBcosnView.addSubview(self.namswkPalsw)
        self.topBcosnView.addSubview(self.checksBtn)
        self.contentView.addSubview(self.swhsiwkViews)
        self.swhsiwkViews.addSubview(self.limtiwskLab)
        self.swhsiwkViews.addSubview(self.limtiwsValuekLab)
        self.swhsiwkViews.addSubview(self.rateiwskLab)
        self.swhsiwkViews.addSubview(self.ratewsValuekLab)
        
        self.topBcosnView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        }
        
        self.logiskwImfbsView.snp.makeConstraints { make in
            make.size.equalTo(32)
            make.verticalEdges.equalToSuperview().inset(12)
            make.left.equalToSuperview().offset(14)
        }
        
        self.namswkPalsw.snp.makeConstraints { make in
            make.left.equalTo(self.logiskwImfbsView.snp.right).offset(10)
            make.centerY.equalTo(self.logiskwImfbsView)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.7)
        }
        
        self.checksBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(self.logiskwImfbsView)
            make.height.equalTo(32)
        }
        
        self.swhsiwkViews.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.topBcosnView)
            make.top.equalTo(self.topBcosnView.snp.bottom)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        self.limtiwskLab.snp.makeConstraints { make in
            make.left.equalTo(self.logiskwImfbsView)
            make.top.equalToSuperview().offset(14)
        }
        
        self.rateiwskLab.snp.makeConstraints { make in
            make.left.equalTo(self.limtiwskLab)
            make.top.equalTo(self.limtiwskLab.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        self.limtiwsValuekLab.snp.makeConstraints { make in
            make.right.equalTo(self.checksBtn)
            make.centerY.equalTo(self.limtiwskLab)
        }
        
        self.ratewsValuekLab.snp.makeConstraints { make in
            make.right.equalTo(self.limtiwsValuekLab)
            make.centerY.equalTo(self.rateiwskLab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadCwlswkItesModel(model: UnaffectedListItem) {
        self.namswkPalsw.text = model.lifeless
        if let _ue_w = model.bless, let _u = URL(string: _ue_w) {
            self.logiskwImfbsView.setImageWith(_u, options: YYWebImageOptions.setImageWithFadeAnimation)
        }
        
        self.checksBtn.setTitle(model.protect, for: UIControl.State.normal)
        self.limtiwskLab.text = model.worthy
        self.limtiwsValuekLab.text = model.distraction
        self.rateiwskLab.text = model.shewn
        self.ratewsValuekLab.text = model.oblige
    }
}
