//
//  CitySinfslwChoosePopView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/24.
//

import UIKit

class CityCellswk: UITableViewCell {
    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.2)], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        vew.isHidden = true
        return vew
    }()
    
    private(set) lazy var ciskwLab: UILabel = UILabel.normalTextLabel("", t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_SemiBold))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.gradiensView)
        self.contentView.addSubview(self.ciskwLab)
        
        self.gradiensView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.ciskwLab.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CitySinfslwChoosePopView: EsensiwlwsBadisnPresentView {

    private lazy var dayLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_ri"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var monthLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_month"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var yearLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_year"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    
    private lazy var pickerContentView: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: jk_kScreenW - 108, height: 305))
        view.contentSize = CGSize(width: (jk_kScreenW - 108) * 3, height: 0)
        view.isPagingEnabled = true
        view.isScrollEnabled = false
        return view
    }()
    
    private lazy var cityTableView1: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var cityTableView2: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var cityTableView3: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private(set) var selectedDate: String?
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("auth_pop_select")
        
        self.contentView.addSubview(self.dayLabs)
        self.contentView.addSubview(self.monthLabs)
        self.contentView.addSubview(self.yearLabs)
        self.contentView.addSubview(self.pickerContentView)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.monthLabs.snp.makeConstraints { make in
            make.centerX.equalTo(self.titleLab)
            make.top.equalTo(self.titleLab.snp.bottom).offset(36)
        }
        
        self.yearLabs.snp.makeConstraints { make in
            make.centerY.equalTo(self.monthLabs)
            make.right.equalToSuperview().offset(-45)
        }
        
        self.dayLabs.snp.makeConstraints { make in
            make.centerY.equalTo(self.monthLabs)
            make.left.equalToSuperview().offset(30)
        }
        
        self.pickerContentView.snp.makeConstraints { make in
            make.top.equalTo(self.monthLabs.snp.bottom)
            make.left.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: jk_kScreenW - 108, height: 305))
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(self.titleLab)
            make.top.equalTo(self.pickerContentView.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-27)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        self.timePickerView.doneBlock?()
        super.confirmClick(sender: sender)
    }
    
    override func closePresentView() {
        super.closePresentView()
        self.closeClosure?(self)
    }
}
