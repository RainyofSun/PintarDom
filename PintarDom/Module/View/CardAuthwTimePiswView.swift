//
//  CardAuthwTimePiswView.swift
//  PintarDom
//
//  Created by 一刻 on 2025/11/23.
//

import UIKit
import BRPickerView

class CardAuthwTimePiswView: EsensiwlwsBadisnPresentView {

    open var closeClosure: ((EsensiwlwsBadisnPresentView) -> Void)?
    
    private lazy var dayLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_ri"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var monthLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_month"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    private lazy var yearLabs: UILabel = UILabel.normalTextLabel(APPLanguageInsTool.loadLanguage("auth_card_pop_year"), t_color: UIColor.ppBlack33, t_f: UIFont.loadSpecialFont(size: 16, ftStyle: FontStyle.Inter_SemiBold))
    
    private lazy var gradiensView: GradientColorView = {
        let vew = GradientColorView()
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#72FFE4", alpha: 0.2), UIColor.hexStringColor(hexString: "#3FE2FF", alpha: 0.2)], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        return vew
    }()
    
    private lazy var timePickerView: BRDatePickerView = {
        let picker = BRDatePickerView(frame: CGRectZero)
        picker.minDate = NSDate.br_setYear(1949, month: 3, day: 12)
        picker.maxDate = NSDate.now
        picker.pickerMode = .YMD
        let pickerStyle = BRPickerStyle()
        pickerStyle.hiddenDoneBtn = true
        pickerStyle.hiddenCancelBtn = true
        pickerStyle.hiddenTitleLine = true
        pickerStyle.pickerColor = .clear
        pickerStyle.pickerTextColor = UIColor.ppBlack33
        pickerStyle.pickerTextFont = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium)
        pickerStyle.selectRowTextColor = UIColor.ppBlack33
        pickerStyle.selectRowTextFont = UIFont.loadSpecialFont(size: 14, ftStyle: FontStyle.Inter_Medium)
        pickerStyle.separatorColor = UIColor.clear
        pickerStyle.pickerHeight = 305
        picker.pickerStyle = pickerStyle
        
        return picker
    }()
    
    private lazy var pickerContentView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: jk_kScreenW - 108, height: 305))
    private(set) var selectedDate: String?
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("auth_pop_select")
        
        self.contentView.addSubview(self.dayLabs)
        self.contentView.addSubview(self.monthLabs)
        self.contentView.addSubview(self.yearLabs)
        self.contentView.addSubview(self.gradiensView)
        self.contentView.addSubview(self.pickerContentView)
        self.timePickerView.addPicker(to: self.pickerContentView)
        
        self.timePickerView.resultBlock = {[weak self] (selesssctDate: Date?, selectValue: String?) in
            guard let _date = selesssctDate else {
                return
            }
            self?.selectedDate = NSDate.br_string(from: _date, dateFormat: "yyyy-MM-dd")
        }
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
        
        self.timePickerView.snp.makeConstraints { make in
            make.top.equalTo(self.monthLabs.snp.bottom)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(305)
        }
        
        self.gradiensView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.timePickerView)
            make.height.equalTo(40)
            make.centerY.equalTo(self.timePickerView)
        }
        
        self.confirmBtn.snp.remakeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(self.titleLab)
            make.top.equalTo(self.timePickerView.snp.bottom).offset(12)
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
