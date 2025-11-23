//
//  OrderskwksCelswkTableViewCell.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/22.
//

import UIKit

class OrderskwksCelswkTableViewCell: UITableViewCell {

    private lazy var topBcosnView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#0DA2F5"), UIColor.hexStringColor(hexString: "#0DF5A2")], gradientStyle: GradientDirectionStyle.leftTopToRightBottom)
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
    
    private lazy var prosjwLab: UIButton = UIButton(type: UIButton.ButtonType.custom)
    
    private lazy var namswkPalsw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var whisnwebBView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(16)
        return view
    }()
    
    private lazy var accountlasw: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 24, ftStyle: FontStyle.Inter_SemiBold))
    
    private(set) lazy var checksBtn: APPActivityButton = APPActivityButton.buildLoadingAnimationButton(title: "")
    private lazy var swhsiwkViews: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#F0FCFF", alpha: 0.84)
        view.corner(16)
        return view
    }()
    
    private var _pspwks_url: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.prosjwLab.isHidden = true
        self.checksBtn.corner(19)
        self.checksBtn.isUserInteractionEnabled = false
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
        
        self.contentView.addSubview(self.topBcosnView)
        self.topBcosnView.addSubview(self.logiskwImfbsView)
        self.topBcosnView.addSubview(self.prosjwLab)
        self.topBcosnView.addSubview(self.namswkPalsw)
        self.contentView.addSubview(self.whisnwebBView)
        self.whisnwebBView.addSubview(self.accountlasw)
        self.whisnwebBView.addSubview(self.checksBtn)
        self.whisnwebBView.addSubview(self.swhsiwkViews)
        
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
        
        self.prosjwLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.logiskwImfbsView)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.whisnwebBView.snp.makeConstraints { make in
            make.top.equalTo(self.topBcosnView.snp.bottom)
            make.horizontalEdges.equalTo(self.topBcosnView)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        self.accountlasw.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
        }
        
        self.checksBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(self.accountlasw)
            make.height.equalTo(38)
        }
        
        self.swhsiwkViews.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(self.accountlasw.snp.bottom).offset(10)
            make.height.equalTo(70)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadCOwskCelslwModel(model: OrderItem) {
        self.namswkPalsw.text = model.lifeless
        if let _ue_w = model.bless, let _u = URL(string: _ue_w) {
            self.logiskwImfbsView.setImageWith(_u, options: YYWebImageOptions.setImageWithFadeAnimation)
        }
        
        self.accountlasw.text = model.considerable
        self.checksBtn.setTitle(model.protect, for: UIControl.State.normal)
        if let _uws = model.fortunes, !_uws.isEmpty {
            self.prosjwLab.isHidden = false
            self.prosjwLab.setAttributedTitle(NSAttributedString(string: _uws, attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_SemiBold), .foregroundColor: UIColor.hexStringColor(hexString: "#0008FB"), .underlineStyle: NSUnderlineStyle.single.rawValue, .underlineColor: UIColor.hexStringColor(hexString: "#0008FB")]), for: UIControl.State.normal)
            self._pspwks_url = model.broken
        } else {
            self.prosjwLab.isHidden = true
        }
        
        if let _diwks = model.fast {
            self.bulslwItemsw(source: _diwks)
        }
    }
    
    @objc func cliskwProskwPorksSender() {
        if let _ursw = self._pspwks_url {
            LuyouswkMakswTool.luYou.tiaoZhuanPage(luyouUrl: _ursw)
        }
    }
    
    func bulslwItemsw(source: [FastItem]) {
        self.swhsiwkViews.subviews.forEach { elem in
            if elem is UILabel {
                elem.removeFromSuperview()
            }
        }
        
        var leftsjwj: UILabel?
        source.enumerated().forEach { (index, element) in
            let elsmwLab: UILabel = UILabel(frame: CGRectZero)
            elsmwLab.numberOfLines = 0
            elsmwLab.textAlignment = .center
            if let _e1 = element.teach, let _e2 = element.shook {
                let paramssty: NSMutableParagraphStyle = NSMutableParagraphStyle()
                paramssty.paragraphSpacing = 4
                paramssty.alignment = .center
                
                let swlsl = NSMutableAttributedString(string: "\(_e1)\n", attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.hexStringColor(hexString: "#999999"), .paragraphStyle: paramssty])
                swlsl.append(NSAttributedString(string: _e2, attributes: [.font: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_SemiBold), .foregroundColor: UIColor.hexStringColor(hexString: "#202020")]))
                elsmwLab.attributedText = swlsl
            }
            
            self.swhsiwkViews.addSubview(elsmwLab)
            
            if let _l = leftsjwj {
                if index == source.count - 1 {
                    elsmwLab.snp.makeConstraints { make in
                        make.right.equalToSuperview().offset(-10)
                        make.left.equalTo(_l.snp.right).offset(8)
                        make.width.centerY.equalTo(_l)
                    }
                } else {
                    elsmwLab.snp.makeConstraints { make in
                        make.left.equalTo(_l.snp.right).offset(8)
                        make.width.centerY.equalTo(_l)
                    }
                }
            } else {
                elsmwLab.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(8)
                    make.verticalEdges.equalToSuperview().inset(3)
                }
            }
            
            leftsjwj = elsmwLab
        }
    }
}
